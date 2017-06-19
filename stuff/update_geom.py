import logging
import time
import os
import argparse
from re import search
from dbutils import dbutils
from transect import Transect
from osgeo import ogr


class UpdateGeom(object):
    """ Update geom column"""

    @staticmethod
    def processCmdLine():
        parser = argparse.ArgumentParser(description="Update column geom.")
        parser.add_argument("-t", "--transects", type=str, help="Path of the Transects.")
        parser.add_argument("-d", "--dbname", type=str, help="DB name.")
        parser.add_argument("-u", "--user", type=str, help="Postgres user. Default 'postgres'.")
        parser.add_argument("-p", "--password", type=str, help="Postgres password. Default ''")
        parser.add_argument("-ip", "--ip", type=str, help="Postgres host.")
        parser.add_argument("-ts", "--tablespace", type=str, help="Default 'pg_default'.")
        parser.add_argument("-n", "--tablename", type=str, help="Postgres table name. Default 'metrics'.")
        parser.add_argument("-tf", "--transectfield", type=str, help="Table column name. Default 'filename'.")
        parser.add_argument("-xf", "--xfield", type=str, help="X field name. Default 'x'.")
        parser.add_argument("-y", "--yfield", type=str, help="Y field name. Default 'y'.")
        parser.add_argument("-xd", "--xdim", type=int, help="X dimension. Default '5000'.")
        parser.add_argument("-yd", "--ydim", type=int, help="Y dimension. Default '5000'.")
        parser.add_argument("-l", "--log", type=str, help="Logs to a file. Default 'console'.")

        args = parser.parse_args()
        if not os.path.isdir(args.transects):
            raise RuntimeError("Directory '{}' not found".format(args.transects))
        return args

    def __init__(self, transectsPath, dbname, user="postgres", password="", host="localhost", tablespace="pg_default",
                 tableName="metrics", transenctField="filename", xfield="x", yfield="y", xdim=5000, ydim=5000):
        if not transectsPath:
            raise RuntimeError("Argument 'transectsPath' is mandatory.")

        if not dbname:
            raise RuntimeError("Argument 'dbname' is mandatory.")

        self._db = dbutils(host, user, password, dbname, tablespace)
        self._transectsPath = transectsPath
        self._tableName = tableName
        self._transectField = transenctField
        self._xfield = xfield
        self._yfield = yfield
        self._xdim = xdim
        self._ydim = ydim

    def run(self, log=None):
        if log:
            logging.basicConfig(filename=log, level=logging.INFO)
        else:
            logging.basicConfig(level=logging.INFO)

        logging.info("Start update..")
        t0 = time.clock()

        schema = self._db.getTableSchema(self._tableName)
        if "geom" in schema:
            sqlDropColumn = "ALTER TABLE {} DROP COLUMN geom;".format(self._tableName)
            dropResult = self._db.execute(sqlDropColumn, autocommit=True)
            logging.info("Drop column SQL result: {}".format(str(dropResult)))
            logging.debug("Running SQL: \n{}".format(sqlDropColumn))

        sqlAddColumn = "ALTER TABLE {} ADD COLUMN geom geometry(Geometry);".format(self._tableName)
        addResult = self._db.execute(sqlAddColumn, autocommit=True)
        logging.info("Add column SQL result: {}".format(str(addResult)))
        logging.debug("Running SQL: \n{}".format(addResult))

        transectsProj = {}
        sqlTransectsFilename = "SELECT DISTINCT({}) FROM {};".format(self._transectField, self._tableName)

        def setTransectEPSG(row):
            if row and len(row) > 0:
                filename = row[0]
                if filename not in transectsProj:
                    try:
                        transect = Transect(self._transectsPath, filename)
                        srs = self.__getSpatialRef(transect)
                        geogcs = srs.GetAttrValue("GEOGCS")
                        datum = srs.GetAttrValue("DATUM")
                        zone = srs.GetUTMZone()
                        transectsProj[filename] = self.__getEPSG(filename, zone, geogcs, datum)
                    except Exception as e:
                        logging.error(e)

        logging.debug("Running SQL: \n{}".format(sqlTransectsFilename))
        self._db.forEachData(sqlTransectsFilename, setTransectEPSG)

        sqlUpdateGeom = """
        UPDATE {0}
        SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint({1}, {2}), ST_MakePoint({1} + {3}, {2}), ST_MakePoint({1} + {3}, {2} + {4}), ST_MakePoint({1}, {2} + {4}), ST_MakePoint({1}, {2})])), {5})
        WHERE {6} = '{7}';
        """

        errors = {}
        for filename, proj in transectsProj.iteritems():
            try:
                sql = sqlUpdateGeom.format(self._tableName, self._xfield, self._yfield, self._xdim, self._ydim, proj,
                                           self._transectField, filename)
                logging.debug("Running SQL: \n{}".format(sql))
                result = self._db.execute(sql, autocommit=True)
                logging.info("Update geom SQL result: {}".format(str(result)))
                logging.info("The geom of '{}' was updated with projection '{}'".format(filename, proj))
            except Exception as e:
                logging.error("Error to process '{}': {}".format(filename, e))
                errors[filename] = e

        if len(errors) > 0:
            logging.warning("Files with problems: ")
            for filename, error in errors.iteritems():
                logging.warning("{} with {}".format(filename, error))

        logging.info("The column geom was created in {} seconds.".format(time.clock() - t0))

    def __getEPSG(self, filename, zone, geogcs, datum):
        if not (search("(GCS)*(SIRGAS)*(2000)", geogcs) or search("(D)*(SIRGAS)*(2000)", datum)):
            raise RuntimeError("GEOGCS '{}' not found in '{}'.".format(geogcs, filename))

        sirgas = {
            14: "31968",
            15: "31969",
            16: "31970",
            17: "31971",
            18: "31972",
            19: "31973",
            20: "31974",
            21: "31975",
            22: "31976",
            -17: "31977",
            -18: "31978",
            -19: "31979",
            -20: "31980",
            -21: "31981",
            -22: "31982",
            -23: "31983",
            -24: "31984",
            -25: "31985",
        }

        return sirgas[zone]

    def __getTransectBoudingBox(self, transect):
        BASE_NAME_DIR = "T-"
        BASE_NAME_TRANSECT = "POLIGONO_T-"
        BASE_EXTENSION = ".shp"

        transectDirName = BASE_NAME_DIR + transect.number
        originalTransectDir = os.path.join(self._transectsPath, transectDirName)
        if os.path.isdir(originalTransectDir):
            boudingBoxFile = BASE_NAME_TRANSECT + transect.number + BASE_EXTENSION
            for pol_dir in os.listdir(originalTransectDir):
                if self.__isPolygonDir(pol_dir):
                    return os.path.join(originalTransectDir, pol_dir, boudingBoxFile)
        else:
            raise RuntimeError("Directory '{}' not found".format(originalTransectDir))

    def __getSpatialRef(self, transect):
        driver = ogr.GetDriverByName("ESRI Shapefile")
        path = self.__getTransectBoudingBox(transect)
        if path:
            dataset = driver.Open(path)
            layer = dataset.GetLayer()
            srs = layer.GetSpatialRef()
            dataset.Destroy()

            return srs

    def __hasExtension(self, filename, extension):
        return filename.lower().endswith(extension, -1 * len(extension))

    def __isPolygonDir(self, dirname):
        return dirname.startswith("POLIGONO")


if __name__ == "__main__":
    try:
        args = UpdateGeom.processCmdLine()
        cs = UpdateGeom(transectsPath=args.transects, dbname=args.dbname, user=args.user, password=args.password,
                        host=args.ip, tablespace=args.tablespace,
                        tableName=args.tablename, transenctField=args.transectfield, xfield=args.xfield,
                        yfield=args.yfield, xdim=args.xdim, ydim=args.ydim)
        cs.run(log=args.log)
    except Exception as e:
        raise RuntimeError("Unexpected error: {}".format(e))
