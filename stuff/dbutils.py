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
           