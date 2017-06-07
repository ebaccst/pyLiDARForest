# -*- coding: utf-8 -*-
import argparse
import sys
import psycopg2
import dbutils
import os

def Header():
    print('Import csv PostGre v0.8')
    print

def ParseCmdLine():
    # G:\SUB07_DADOS_BASE\GRID\clipgrid.sql -s localhost -u postgres -p ebaeba18 -d eba -c 10000
    parser = argparse.ArgumentParser(description='Process script text file in Postgre.')
    parser.add_argument('inputfname',help='Script file to be processed.')
    parser.add_argument('-s','--server',help='server host IP', default = 'localhost')
    parser.add_argument('-u','--user',help='Database user name', default = 'postgre')
    parser.add_argument('-p','--pwd',help='Password')
    parser.add_argument('-d','--database',help='Database name')
    parser.add_argument('-t','--tablename',help='Destination table.')
    parser.add_argument('-c','--commitinterval',help=r'Statements between commits (default=10000).', type=int, default = 10000)
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
    i=0
    sql=''
    with open(args.inputfname) as script:
        for line in script:
            sql+=line
            if not sql.endswith(';\n'):
                continue
            db.execute(sql)
            sql=''
            i+=1
            if (i % args.commitinterval) == 0:
                db.conn.commit()
                print "\r",i,"commited.", 