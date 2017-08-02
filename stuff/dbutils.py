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
        self.fieldnames=[]

        self.conn=None
        try:
            self.conn=pg.connect(host=self.server,user=self.user,password=self.pwd,database=self.database)
        except pg.Error, e:
            print e.diag.message_primary

    def validatefieldname(self,fieldname):
        fieldname=fieldname.lower()
        reservedwords=['all','index']
        fieldname=''.join([i if (ord('a') <= ord(i) <= ord('z')) or (ord('0') <= ord(i) <= ord('9')) else '_' for i in fieldname])
        fieldname=fieldname.strip('_')
        if fieldname in reservedwords:
            fieldname = fieldname + "_"
        while fieldname in self.fieldnames:
            fieldname+='_'
        self.fieldnames.append(fieldname)
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
        self.execute("DROP SEQUENCE{0} public.{1}_idimport_seq".format(" IF EXISTS" if ifexists else "",tablename),True)

    def createsequence(self,tablename):
        self.execute('''
CREATE SEQUENCE public.{0}_idimport_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;
ALTER SEQUENCE public.{0}_idimport_seq
    OWNER to {1};
'''.format(tablename,self.user),True)

    def getfielddatatype(self,field,data,skipfields=0,nullvalue=None):
        typsel = 'STR'
        types = [(int,'INT'),
                 (float,'FLOAT'),
                 (str,'STR')]
        for rec in data:
            if (rec[field] == nullvalue):
                continue
            for typ, typestr in types:
                try:
                    typ(rec[field])
                    if (typsel == 'FLOAT') and (typestr == 'INT'):
                        typsel = 'FLOAT'
                    if typsel == 'STR':
                        return 'character varying(50) COLLATE pg_catalog."default"'
                    else:
                        break
                except ValueError:
                    continue
        return 'character varying(50) COLLATE pg_catalog."default"' if typsel == 'STR' else typestr

    def createtable(self,tablename,fields,data,skipfields=0,nullvalue=None,createfilenamefield=False):
        self.droptable(tablename,True)
        self.dropsequence(tablename,True)
        self.createsequence(tablename)
        fieldssql="idimport integer NOT NULL DEFAULT nextval('{0}_idimport_seq'::regclass),\r\n".format(tablename)+("" if not createfilenamefield else 'filename character varying(32),')+'\r\n'
        for i in range(len(fields)):
            fieldssql+='    {0} {1},\r\n'.format(self.sqlvalidfieldnames[i],self.getfielddatatype(fields[i],data,skipfields,nullvalue))
        createtablesql='''CREATE TABLE public.{0} (
{1}
    CONSTRAINT {0}_pkey PRIMARY KEY (idimport)
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
        self.execute("SET CLIENT_ENCODING TO 'LATIN1';")
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
                sql+=("'{0}',".format(str(rec[field]).replace("'","''")) if rec[field] != '' else 'NULL,')
            try:
                sql=sql[:-1]+')'
                self.execute(sql)
            except:
                e = sys.exc_info()[0]
                print "Error {0} in csv file line {1}. SQL: {2}".format(e,count,sql)
                raise
            count=count+1
            if (count % 1000) == 0:
                self.conn.commit()
        if self.conn.status == pg.extensions.STATUS_BEGIN:
             self.conn.commit()
        return count

    def addautoincpostgrescript(self,filename,newfilename=None):
        if newfilename == None:
            newfilename = filename
        f = open(filename,'r')
        inp = f.readlines()
        f.close()
        out = []
        seqs = ''
        for line in inp:
            words=line.strip().replace('.',' ').split(' ')
            idcreated = False
            if len(words) >= 3:
                if words[0] == 'CREATE' and words[1] == 'TABLE':
                    tablename=words[3]
                elif words[0] == 'id':
                    fieldname='id'
                    idcreated = True
                if (idcreated):
                    line = "id integer NOT NULL DEFAULT nextval('{0}_id_seq'::regclass),\r\n".format(tablename)
                    seqs += '''CREATE SEQUENCE public.{0}_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 9223372036854775807
    CACHE 1;

'''.format(tablename)
            out.append(line)
        out.insert(0,seqs)
        f = open(newfilename,'w')
        f.writelines(out)
        f.close()

    def close(self):
        self.conn.close()
'''
    def tableclean(self,tablename,skipfields,nullvalue):
        sqldeletenull="DELETE FROM {0} WHERE ".format(tablename)
        for i in range(len(self.sqlvalidfieldnames)-(skipfields+2)):
            sqldeletenull+="{0} = '{1}' AND ".format(self.sqlvalidfieldnames[i+skipfields+2],nullvalue)
        return self.execute(sqldeletenull[:-5],True)
'''
