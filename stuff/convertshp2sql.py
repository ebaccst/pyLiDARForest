# -*- coding: utf-8 -*-
import argparse
import sys
import psycopg2
import csv
import dbutils
import os
import subprocess
import glob
import dbutils

def Header():
    print('Convert shp to sql v0.8')
    print

def runcommand(command,verbose=False):
    print command
    p = subprocess.Popen(command,
                stdout=subprocess.PIPE,
                stderr=subprocess.STDOUT)
    out, err = p.communicate()
    if ((out != None) and ("ERROR" in out)) or ((err != None) and ("ERROR" in err)):
        print "Error in command: {0} Message: {1}{2}".format(command,out,err)
        raise 
    if verbose > 0:
        print(out)
    return out, err

def ParseCmdLine():
    # G:\TRANSECTS\SHP_FWF\*.shp flightpoly sql.sql -s 4326 -g geom
    parser = argparse.ArgumentParser(description='Convert shp to sql.')
    parser.add_argument('inputfmask',help='File mask to be processed.')
    parser.add_argument('tablename',help='Destination table.')
    parser.add_argument('outputfname',help='Destination SQL file')
    parser.add_argument('-s','--server',help='server host IP', default = 'localhost')
    parser.add_argument('-u','--user',help='Database user name', default = 'postgre')
    parser.add_argument('-p','--pwd',help='Password')
    parser.add_argument('-d','--database',help='Database name')
    parser.add_argument('-c','--createtable',help=r'Recreate table if it exists.', default = False, action = 'store_true')
    parser.add_argument('-ph','--shp2pgsqlpath', help='Path to shp2pgsql program',default='C:\\Program Files\\PostgreSQL\\9.6\\bin\\')
    parser.add_argument('-srid','--srid', type=int, help='SRID to be used')
    parser.add_argument('-g','--geocolumn', help='name of geometry column',default='geom')
    parser.add_argument('-v','--verbose', type=int, help = 'Show intermediate messages.',default=0)

    try:
        return parser.parse_args()
    except:
        print("Unexpected error:", sys.exc_info()[0])
        raise

if __name__ == '__main__':
    Header()
    args=ParseCmdLine()
    files=glob.glob(args.inputfmask)
    createtable=args.createtable
    db=dbutils.dbutils(args.server,args.user,args.pwd,args.database,'pg_default')
    for file in files:
        command='{0}shp2pgsql.exe -s {1} {2}  -T pg_default -g {3} {4} {5}'.format(args.shp2pgsqlpath,args.srid,'-d' if createtable else '-a',args.geocolumn,file,args.tablename)
        txt=runcommand(command,args.verbose)
        sql=txt[0]
        if createtable:
            sql=sql.replace("SELECT DropGeometryColumn('','{0}','{1}');".format(args.tablename,args.geocolumn),'')
            createtable=False
        p=sql.index('ANALYZE')
        if p > 0:
            sql=sql[0:p]
        db.execute(sql,True)
#        x=db.getdata("SELECT table_schema, table_name, table_type FROM information_schema.tables;")
#        print x
#        print
    db.close()