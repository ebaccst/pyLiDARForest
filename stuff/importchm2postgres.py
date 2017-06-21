import os
import time
import logging
import csv
import argparse
from transect import Transect
from dbutils import dbutils


class CHMLoader(object):
    """ Load CHM from CSV"""

    @staticmethod
    def processCmdLine():
        parser = argparse.ArgumentParser(description="Insert CHM.")
        parser.add_argument("-c", "--csv", type=str, help="Path of the CSV.")
        parser.add_argument("-d", "--dbname", type=str, help="DB name.")
        parser.add_argument("-u", "--user", type=str, help="Postgres user. Default 'postgres'.")
        parser.add_argument("-p", "--password", type=str, help="Postgres password. Default ''")
        parser.add_argument("-ip", "--ip", type=str, help="Postgres host.")
        parser.add_argument("-ts", "--tablespace", type=str, help="Default 'pg_default'.")
        parser.add_argument("-n", "--tablename", type=str, help="Postgres table name. Default 'metrics'.")
        parser.add_argument("-l", "--log", type=str, help="Logs to a file. Default 'console'.")

        args = parser.parse_args()
        if not os.path.isdir(args.csv):
            raise RuntimeError("Directory '{}' not found".format(args.csv))
        return args

    def __init__(self, chmPath, db, tablename="metrics", index="index", x="x", y="y", value="csv", nullvalue="-",
                 log=None):
        self._chmPath = chmPath
        self._db = db
        self._tablename = tablename
        self._index = index
        self._x = x
        self._y = y
        self._value = value
        self._nullvalue = nullvalue
        self._errors = {}

        if log:
            logging.basicConfig(filename=log, level=logging.INFO)
        else:
            logging.basicConfig(level=logging.INFO)

    def load(self):
        for filename in os.listdir(self._chmPath):
            if os.path.isfile(os.path.join(self._chmPath, filename)) and self.__hasExtension(filename, ".csv"):
                try:
                    transect = Transect(self._chmPath, filename)
                    self.__process(transect)
                except Exception as err:
                    logging.error("Error to process {}: {}".format(filename, err))
                    self._errors[filename] = err

    def __csv(self, path):
        chm = []
        with open(path, 'r') as f:
            fieldnames = [self._index, self._x, self._y, self._value]
            reader = csv.DictReader(f, fieldnames=fieldnames)
            header = reader.next()
            # small bug in generated csv: index,x,y,csv0,731725.000,9677075.000,-
            header = header[None]
            if header[2] != self._nullvalue:
                chm.append({self._index: '0', self._x: header[0], self._y: header[1], self._value: header[2]})

            for line in reader:
                if line[self._value] != self._nullvalue:
                    chm.append(line)
        return chm

    def __exists(self, where):
        return self._db.exists(self._tablename, where=where)

    def __getUpdateColumnCHMSQL(self, chm, where):
        return "UPDATE {} SET chm = {} WHERE {};".format(self._tablename, chm, where)

    def __getWhereCodition(self, transect, x, y):
        filename = "NP_T-{}.CSV".format(transect.number)
        where = "filename = '{}' AND x = {} AND y = {}".format(filename, x, y)
        return where

    def __hasExtension(self, filename, extension):
        return filename.endswith(extension, -1 * len(extension))

    def __insertRec(self, transect, chm):
        filename = "'NP_T-{}.CSV'".format(transect.number)
        fieldnames = ["filename", self._x, self._y, "chm"]
        data = [filename, chm[self._x], chm[self._y], chm[self._value]]

        sql = "INSERT INTO {} ({}) VALUES({});".format(self._tablename, ", ".join(fieldnames), ", ".join(data))
        result = self._db.execute(sql, autocommit=True)
        if result < 0:
            logging.error("Error to execute: '{}'".format(sql))
        else:
            logging.info("SQL executed with success")

    def __process(self, transect):
        logging.info("Loading CHM of transect {}".format(transect.number))
        for chm in self.__csv(transect.path):
            whereCodition = self.__getWhereCodition(transect, chm[self._x], chm[self._y])
            if self.__exists(whereCodition):
                logging.info("Update({}, {}) with 'chm' {}".format(chm[self._x], chm[self._y], chm[self._value]))
                self.__updateColumnCHM(chm[self._value], whereCodition)
            else:
                logging.warning("Add record({}, {}) with 'chm' {}".format(chm[self._x], chm[self._y], chm[self._value]))
                self.__insertRec(transect, chm)

    def __updateColumnCHM(self, chm, where):
        sql = self.__getUpdateColumnCHMSQL(chm, where)
        result = self._db.execute(sql, autocommit=True)
        if result < 0:
            logging.error("Error to execute: '{}'".format(sql))
        else:
            logging.info("SQL executed with success")


if __name__ == "__main__":
    try:
        t0 = time.clock()
        args = CHMLoader.processCmdLine()

        db = dbutils(args.ip, args.user, args.password, args.dbname, "pg_default")
        loader = CHMLoader(args.csv, db, log=args.log)
        loader.load()

        logging.info("The CHM was inserted in {} seconds.".format(time.clock() - t0))
    except Exception as e:
        raise RuntimeError("Unexpected error: {}".format(e))
