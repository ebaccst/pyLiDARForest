import os
import time
import logging
import csv
import argparse
from transect import Transect
from dbutils import dbutils
from update_geom import UpdateGeom


class CHMLoader(object):
    """ Load CHM from CSV"""

    @staticmethod
    def processCmdLine():
        parser = argparse.ArgumentParser(description="Insert CHM.")
        parser.add_argument("-t", "--transects", type=str, help="Path of the Transects.")
        parser.add_argument("-c", "--csv", type=str, help="Path of the CSV.")
        parser.add_argument("-d", "--dbname", type=str, help="DB name.")
        parser.add_argument("-u", "--user", type=str, help="Postgres user. Default 'postgres'.")
        parser.add_argument("-p", "--password", type=str, help="Postgres password. Default ''")
        parser.add_argument("-ip", "--ip", type=str, help="Postgres host.")
        parser.add_argument("-n", "--tablename", type=str, help="Postgres table name. Default 'metrics'.")
        parser.add_argument("-tf", "--transectfield", type=str, help="Table column name. Default 'filename'.")
        parser.add_argument("-xf", "--xfield", type=str, help="X field name. Default 'x'.")
        parser.add_argument("-yf", "--yfield", type=str, help="Y field name. Default 'y'.")
        parser.add_argument("-xd", "--xdim", type=int, help="X dimension. Default '5000'.")
        parser.add_argument("-yd", "--ydim", type=int, help="Y dimension. Default '5000'.")
        parser.add_argument("-e", "--epsg", type=int, help="EPSG of new column. Default '4674'.")
        parser.add_argument("-l", "--log", type=str, help="Logs to a file. Default 'console'.")

        args = parser.parse_args()
        if not os.path.isdir(args.csv):
            raise RuntimeError("Directory '{}' not found".format(args.csv))
        return args

    def __init__(self, chmPath, db, tableName="metrics", index="index", x="x", y="y", value="csv", nullValue="-",
                 log=None):
        self._chmPath = chmPath
        self._db = db
        self._tableName = tableName
        self._index = index
        self._x = x
        self._y = y
        self._value = value
        self._nullValue = nullValue
        self._errors = {}
        self._transectId = {}
        self._existsRecords = []
        self._updateRecords = []
        self._insertRecords = []
        self._chmQueue = []
        self._queryLimit = 40

        if log:
            logging.basicConfig(filename=log, level=logging.INFO)
        else:
            logging.basicConfig(level=logging.INFO)

    @property
    def transects(self):
        transects = {}
        for filename in os.listdir(self._chmPath):
            transect = Transect(self._chmPath, filename)
            if os.path.isfile(transect.path) and self.__hasExtension(filename, ".csv"):
                transects[transect.number] = self.__csv(transect.path)
        return transects

    def load(self):
        self.__loadTransectsId()

        for transect, records in self.transects.iteritems():
            try:
                logging.info("Loading CHM of transect {}".format(transect))
                self.__process(transect, records)
            except Exception as err:
                logging.error("Error to process {}: {}".format(transect, err))
                self._errors[transect] = err

    @property
    def errors(self):
        return self._errors

    def __consumer(self):
        if len(self._updateRecords) > self._queryLimit:
            self.__consumerUpdate()

        if len(self._insertRecords) > self._queryLimit:
            self.__consumerInsert()

    def __consumerInsert(self):
        logging.info("Adding {} records".format(len(self._insertRecords)))
        insert = "".join(self._insertRecords)
        insertResult = self._db.execute(insert, autocommit=True)
        if insertResult < 0:
            logging.error("Error to execute: '{}'".format(insert))
        else:
            logging.info("SQL executed with success")
        del self._insertRecords[:]

    def __consumerUpdate(self):
        logging.info("Updating {} records".format(len(self._updateRecords)))
        update = "".join(self._updateRecords)
        updateResult = self._db.execute(update, autocommit=True)
        if updateResult < 0:
            logging.error("Error to execute: '{}'".format(update))
        else:
            logging.info("SQL executed with success")
        del self._updateRecords[:]

    def __csv(self, path):
        chm = []
        with open(path, 'r') as f:
            fieldnames = [self._index, self._x, self._y, self._value]
            reader = csv.DictReader(f, fieldnames=fieldnames)
            header = reader.next()
            # small bug in generated csv: index,x,y,csv0,731725.000,9677075.000,-
            header = header[None]
            if header[2] != self._nullValue:
                chm.append({self._index: '0', self._x: header[0], self._y: header[1], self._value: header[2]})

            for line in reader:
                if line[self._value] != self._nullValue:
                    chm.append(line)
        return chm

    def __getUpdateColumnCHMSQL(self, chm, where):
        return "UPDATE {} SET chm = {} WHERE {};".format(self._tableName, chm, where)

    def __getWhereCodition(self, transect, x, y):
        filename = "NP_T-{}.CSV".format(transect)
        return "filename = '{}' AND x = {} AND y = {}".format(filename, x, y)

    def __hasExtension(self, filename, extension):
        return filename.endswith(extension, -1 * len(extension))

    def __insertRec(self, transect, x, y, value):
        transectId = ""
        if transect in self._transectId:
            transectId = self._transectId[transect]
        else:
            logging.warning("Transect id of 'T-{}' not found".format(transect))

        filename = "'NP_T-{}.CSV'".format(transect)
        fieldnames = ["filename", self._x, self._y, "chm", "transect_id"]
        data = [filename, x, y, value, transectId]
        self._insertRecords.append("INSERT INTO {} ({}) VALUES({});".format(self._tableName,
                                                                            ", ".join(fieldnames),
                                                                            ", ".join(data)))

    def __loadTransectsId(self):
        sql = "SELECT DISTINCT(filename), transect_id FROM {} WHERE transect_id IS NOT NULL;".format(self._tableName)

        def eachRow(row):
            transect = Transect("psql", row[0]).number
            self._transectId[transect] = str(row[1])

        logging.info("Loading Transencts PK")
        self._db.forEachData(sql, eachRow)

    def __process(self, transect, records):
        while records:
            self.__producer(records.pop(), transect)
            self.__consumer()

        if len(self._updateRecords) > 0:
            self.__consumerUpdate()
        if len(self._insertRecords) > 0:
            self.__consumerInsert()

    def __producer(self, chm_dict, transect):
        where = self.__getWhereCodition(transect, chm_dict[self._x], chm_dict[self._y])
        existsQuery = "(SELECT EXISTS(SELECT 1 FROM {} WHERE {}))".format(self._tableName, where)

        self._chmQueue.append(chm_dict)
        self._existsRecords.append(existsQuery)
        if len(self._existsRecords) > self._queryLimit:
            sql = " UNION ALL ".join(self._existsRecords)
            data = self._db.getdata(sql)

            for i, row in enumerate(data):
                exist = row[0]
                result = self._chmQueue[i]
                x = result[self._x]
                y = result[self._y]
                value = result[self._value]
                if exist:
                    logging.info("Update ({}, {}) with chm {}".format(x, y, value))
                    self.__updateColumnCHM(value, where)
                else:
                    logging.info("Insert ({}, {}) with chm {}".format(x, y, value))
                    self.__insertRec(transect, x, y, value)
            del self._chmQueue[:]
            del self._existsRecords[:]

    def __updateColumnCHM(self, chm, where):
        sql = self.__getUpdateColumnCHMSQL(chm, where)
        self._updateRecords.append(sql)


if __name__ == "__main__":
    # C:\Anaconda\envs\geo\python.exe "E:\heitor.guerra\PycharmProjects\pyLiDARForest\stuff\importchm2postgres.py" -c "E:\heitor.guerra\CHM_50m_csv" -d "eba" -u "eba" -p "ebaeba18" -ip "localhost" -t "G:\TRANSECTS" -tf "filename" -xf "x" -yf "y" -xd "50" -yd "50" -e "4674" -l "E:\heitor.guerra\chm.log"
    try:
        t0 = time.clock()
        args = CHMLoader.processCmdLine()

        db = dbutils(args.ip, args.user, args.password, args.dbname, "pg_default")

        loader = CHMLoader(args.csv, db, log=args.log)
        loader.load()

        # up = UpdateGeom(args.transects, db, args.tablename, args.transectfield, args.xfield, args.yfield, args.xdim,
        #                 args.ydim, args.epsg, args.log + "_geom")
        # upErrors = up.updateGeom()

        if len(loader.errors) > 0:
            logging.warning("Files with problems when load CHM: ")
            for filename, error in loader.errors.iteritems():
                logging.warning("{} with {}".format(filename, error))

        # if len(upErrors) > 0:
        #     logging.warning("Files with problems when update geom: ")
        #     for filename, error in upErrors.iteritems():
        #         logging.warning("{} with {}".format(filename, error))

        logging.info("The CHM was inserted in {} seconds.".format(time.clock() - t0))

        # t0 = time.clock()
        #
        # db = dbutils("localhost", "eba", "ebaeba18", "eba", "pg_default")
        # loader = CHMLoader(r"E:\heitor.guerra\CHM_50m_csv_TESTE", db)
        # loader.load()
        #
        # logging.info("The CHM was inserted in {} seconds.".format(time.clock() - t0))
    except Exception as e:
        raise RuntimeError("Unexpected error: {}".format(e))
