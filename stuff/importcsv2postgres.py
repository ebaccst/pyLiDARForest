# -*- coding: utf-8 -*-
import argparse
import sys
import psycopg2
import csv
import dbutils
import os

def Header():
    print('Import csv PostGre v0.8')
    print

def ParseCmdLine():
    # G:\TRANSECTS\LAZ\metrics\NP_T-0295.CSV -s localhost -u postgres -p ebaeba18 -t tempimport -d eba -c -sf 3 -nv -
    parser = argparse.ArgumentParser(description='Import CSV to Postgre.')
    parser.add_argument('inputfname',help='Csv file to be imported.')
    parser.add_argument('-s','--server',help='server host IP', default = 'localhost')
    parser.add_argument('-u','--user',help='Database user name', default = 'postgre')
    parser.add_argument('-p','--pwd',help='Password')
    parser.add_argument('-d','--database',help='Database name')
    parser.add_argument('-t','--tablename',help='Destination table.')
    parser.add_argument('-c','--createtable',help=r'Recreate table if it exists.', default = False, action = 'store_true')
    parser.add_argument('-sf','--skipfields',type=int,help='Fields to skip when checking null values.',default=0)
    parser.add_argument('-nv','--nullvalue', help = 'Null value to be checked',default='')
    parser.add_argument('-v','--verbose', type=int, help = 'Show intermediate messages.',default=0)

    try:
        return parser.parse_args()
    except:
        print("Unexpected error:", sys.exc_info()[0])
        raise

if __name__ == '__main__':
    Header()
    args=ParseCmdLine()
    db=dbutils.dbutils(args.server,args.user,args.pwd,args.database,'pg_default')
    data=[]
    with open(args.inputfname,'r') as f:
        reader=csv.DictReader(f)
        for line in reader:
            data.append(line) 
    db.initsqlvalidfieldnames(reader.fieldnames)
    if(args.createtable):
        db.createtable(args.tablename,reader.fieldnames,data,args.skipfields,args.nullvalue)
    added=db.addrecs(args.tablename,reader.fieldnames,data,args.skipfields,args.nullvalue)
    db.execute("UPDATE {0} SET filename = '{1}' WHERE filename IS NULL".format(args.tablename,os.path.basename(args.inputfname)),True)
    print('File {0} imported, {1} lines processed, {2} recs added'.format(args.inputfname, len(data), added))