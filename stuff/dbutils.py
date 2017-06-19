# -*- coding: utf-8 -*-
import argparse
import sys
import psycopg2 as pg

class dbutils(object):
    """Implements a Python interface to LASTools command line tools"""

    def __init__(self,server,user,pwd,database,tablespace):
        self.server=server
        self.user=user
        self.pwd=pwd
        self.database=database
        self.tablespace=tablespace
        self.sqlvalidfieldnames=[]

        self.conn=None
        try:
            self.conn=pg.connect(host=self.server,user=self.user,password=self.pwd,database=self.database)
        except pg.Error, e:
            print e.diag.message_primary

    def validatefieldname(self,fieldname):
        reservedwords=['all','index']
        if fieldname in reservedwords:
            return fieldname + "_"
        else:
            return fieldname

    def initsqlvalidfieldnames(self,fields):
        for i in range(len(fields)):
            self.sqlvalidfieldnames.append(self.validatefieldname(fields[i]))

    def getTableSchema(self, tablename, schema="public"):
        """
        Get the table schema.

        :param tablename: A string with table name.
        :param schema: Default 'public'.
        :return: A dictionary with schema.
        """
        sql = """
        SELECT 
            g.column_name,
            g.data_type,
            g.character_maximum_length,
            g.is_nullable,
            g.udt_name,
            f.type,
            f.srid
        FROM 
             information_schema.columns as g JOIN
             geometry_columns AS f 
                 ON (g.table_schema = f.f_table_schema and g.table_name = f.f_table_name )
        WHERE
            table_schema = '{}' and
            table_name = '{}';
        """.format(schema, tablename)

        data = self.getdata(sql)
        schema = {}
        for field in data:
            schema[field[0]] = {
                "data_type": field[1],
                "character_maximum_length": field[2],
                "is_nullable": field[3],
                "udt_name": field[4],
                "geom_type": field[5],
                "geom_srid": field[6]
            }

        return schema

    def execute(self,sql,autocommit=False,ignoreexcept=False):
        try:
            cur=self.conn.cursor()
            count=cur.execute(sql)
            if autocommit:
                self.conn.commit()
            return cur.rowcount
        except pg.Error, e:
            print e.diag.message_primary
            if not ignoreexcept:
                raise
        except Exception as e:
            print str(e)
            if not ignoreexcept:
                raise

    def getdata(self,sql,ignoreexcept=False):
        try:
            cur=self.conn.cursor()
            cur.execute(sql)
            return cur.fetchall()
            print
        except pg.Error, e:
            print e.diag.message_primary
            if not ignoreexcept:
                raise
            else:
                return None

    def forEachData(self, sql, __sof__, ignoreexcept=False):
        """
        Prevent a massive hit on your database you can either fetch rows in manageable batches.
        Reference: https://stackoverflow.com/questions/17933344/python-postgres-can-i-fetchall-1-million-rows

        :param sql: String SQL.
        :param __sof__: Second Order Function.
        :param ignoreexcept: Defaut False.
        :return: None.
        """
        try:
            cur = self.conn.cursor()
            cur.execute(sql)
            row = cur.fetchone()
            while row:
                __sof__(row)
                row = cur.fetchone()
            cur.close()
        except pg.Error, e:
            print e.diag.message_primary
            if not ignoreexcept:
                raise

    def selectMappedTable(self, tablename, where="", limit=""):
        """
        Select mapped attributes from a given table. Example:

        selectMappedTable("metrics")
        selectMappedTable("metrics", where="filename='NP_T-0225.CSV'")
        selectMappedTable("metrics", where="filename='NP_T-0225.CSV'", limit="1")
        >>> [{'b60': 50.1, 'b40': 28.7, 'b20': 8.2, ...}]

        :param tablename: A string with table name.
        :param where: WHERE condition.
        :param limit: LIMIT condition
        :return: List with the results.
        """
        if where:
            where = "WHERE " + where
        if limit:
            limit = "LIMIT " + limit

        schema = self.getTableSchema(tablename)
        columns = sorted(schema.iterkeys())
        sql = "SELECT {} FROM {} {} {};".format(", ".join(columns), tablename, where, limit)
        result = []
        data = self.getdata(sql)
        for row in data:
            result.append({columns[col]: row[col] for col in range(len(columns))})

        return result

    def droptable(self,tablename,ifexists):
        self.execute("DROP TABLE{0} public.{1}".format(" IF EXISTS" if ifexists else "",tablename),True)
        self.dropsequence(tablename,ifexists)

    def dropsequence(self,tablename,ifexists):
        self.execute("DROP SEQUENCE{0} public.{1}_id_seq".format(" IF EXISTS" if ifexists else "",tablename),True)

    def createsequence(self,tablename):
        self.execute('''
CREATE SEQUENCE public.{0}_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
ALTER SEQUENCE public.{0}_id_seq
    OWNER to {1};
'''.format(tablename,self.user),True)

    def getfielddatatype(self,field,data,skipfields=0,nullvalue=None):
        types = [(int,'INT'),
                 (float,'FLOAT')]
        for rec in data:
            if rec[field] == nullvalue:
                continue
            for typ, typestr in types:
                try:
                    typ(rec[field])
                    return typestr
                except ValueError:
                    continue
            return 'character varying(32) COLLATE pg_catalog."default"'

    def createtable(self,tablename,fields,data,skipfields=0,nullvalue=None):
        self.droptable(tablename,True)
        self.dropsequence(tablename,True)
        self.createsequence(tablename)
        fieldssql="""id integer NOT NULL DEFAULT nextval('{0}_id_seq'::regclass),
cloud_id INT,
filename character varying(32) COLLATE pg_catalog."default",\r\n""".format(tablename)
        for i in range(len(fields)):
            fieldssql+='    {0} {1},\r\n'.format(self.sqlvalidfieldnames[i],self.getfielddatatype(fields[i],data,skipfields,nullvalue))
        createtablesql='''CREATE TABLE public.{0} (
{1}
    CONSTRAINT {0}_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;
ALTER TABLE public.{0}
    OWNER to {2};
'''.format(tablename,fieldssql,self.user)
        self.execute(createtablesql,True)

    def addrecs(self,tablename,fields,data,skipfields=0,nullvalue=None):
        fieldssql=''
        for field in self.sqlvalidfieldnames:
            fieldssql+='{0},'.format(field)
        sqlini='''INSERT INTO {0} ({1}) 
VALUES ('''.format(tablename,fieldssql[:-1])

        count=0
        for rec in data:
            if nullvalue != None:
                nullrec=True
                for i in range(len(fields)-(skipfields)):
                    nullrec=nullrec and (rec[fields[i+skipfields]] == nullvalue)
                if nullrec:
                    continue
            sql=sqlini
            for field in fields:
                sql+="'{0}',".format(rec[field])
            self.execute(sql[:-1]+')')
            count=count+1
            if (count % 1000) == 0:
                self.conn.commit()
        if self.conn.status == pg.extensions.STATUS_BEGIN:
             self.conn.commit()
        return count

    def close(self):
        self.conn.close()
'''
    def tableclean(self,tablename,skipfields,nullvalue):
        sqldeletenull="DELETE FROM {0} WHERE ".format(tablename)
        for i in range(len(self.sqlvalidfieldnames)-(skipfields+2)):
            sqldeletenull+="{0} = '{1}' AND ".format(self.sqlvalidfieldnames[i+skipfields+2],nullvalue)
        return self.execute(sqldeletenull[:-5],True)
'''
