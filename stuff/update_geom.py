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
        parser.add_argument("-t", "--transects", type=str, default=r"G:\TRANSECTS", help="Path of the Transects. Default 'G:\TRANSECTS'")
        parser.add_argument("-d", "--dbname", type=str, default="eba", help="DB name. Default 'eba'")
        parser.add_argument("-u", "--user", type=str, default="eba", help="Postgres user. Default 'eba'.")
        parser.add_argument("-p", "--password", type=str, default="ebaeba18", help="Postgres password. Default 'ebaeba18'")
        parser.add_argument("-ip", "--ip", type=str, default="localhost", help="Postgres host. Default 'localhost'")
        parser.add_argument("-ts", "--tablespace", type=str, default="pg_default", help="Default 'pg_default'.")
        parser.add_argument("-n", "--tablename", type=str, default="metrics", help="Postgres table name. Default 'metrics'.")
        parser.add_argument("-tf", "--transectfield", type=str, default="filename", help="Table column name. Default 'filename'.")
        parser.add_argument("-xf", "--xfield", type=str, default="x", help="X field name. Default 'x'.")
        parser.add_argument("-yf", "--yfield", type=str, default="y", help="Y field name. Default 'y'.")
        parser.add_argument("-xd", "--xdim", type=int,  default=50, help="X dimension. Default '50'.")
        parser.add_argument("-yd", "--ydim", type=int, default=50, help="Y dimension. Default '50'.")
        parser.add_argument("-e", "--epsg", type=int, default=5880, help="EPSG of new column. Default '5880'.")
        parser.add_argument("-s", "--sql", type=str, default=None, help="Export to a SQL file. Default 'None'.")
        parser.add_argument("-l", "--log", type=str, default=None, help="Logs to a file. Default 'None'.")

        args = parser.parse_args()
        if not os.path.isdir(args.transects):
            raise RuntimeError("Directory '{}' not found".format(args.transects))
        return args

    def __init__(self, transects, db, tablename, transectfield, xfield, yfield, xdim, ydim, epsg, sql):
        if not transects:
            raise RuntimeError("Argument 'transectsPath' is mandatory.")

        self._db = db
        self._transects = transects
        self._tablename = tablename
        self._transectfield = transectfield
        self._xfield = xfield
        self._yfield = yfield
        self._xdim = xdim - (xdim / 2)
        self._ydim = ydim - (ydim / 2)
        self._epsg = epsg
        self._sql = sql

    def run(self):
        schema = self._db.getTableSchema(self._tablename)
        if "geom" in schema:
            dropResult = self._db.execute(self.__getDropColumnSQL(), autocommit=True)
            logging.info("Drop column SQL result: {}".format(str(dropResult)))

        addResult = self._db.execute(self.__getAddGeomColumnSQL(), autocommit=True)
        logging.info("Add column SQL result: {}".format(str(addResult)))

        errors, transectsProj = self.__getTransectsProj()
        self.__executeCreateGeom(errors, transectsProj)

        projections = self._db.getdata(self.__getDistinctEPSGSQL())
        self.__executeReproject(errors, projections)

        setSRIDResult = self._db.execute(self.__getSetSRIDSQL(), autocommit=True)
        logging.info("Set SRID SQL result: {}".format(str(setSRIDResult)))

        if len(errors) > 0:
            logging.warning("Files with problems: ")
            for filename, error in errors.iteritems():
                logging.warning("{} with {}".format(filename, error))

    def save(self):
        self._sql = open(self._sql, "a")

        schema = self._db.getTableSchema(self._tablename)
        if "geom" in schema:
            self._sql.write(self.__getDropColumnSQL() + "\n")
            logging.info("Writing 'drop column' command")

        self._sql.write(self.__getAddGeomColumnSQL() + "\n")
        logging.info("Writing 'add column' command")

        errors, transectsProj = self.__getTransectsProj()
        self.__writeCreateGeom(errors, transectsProj)

        projections = self._db.getdata(self.__getDistinctEPSGSQL())
        self.__writeReproject(errors, projections)

        self._sql.write(self.__getSetSRIDSQL() + "\n")
        logging.info("Writing 'Set SRID' command")

        if len(errors) > 0:
            logging.warning("Files with problems: ")
            for errorName, error in errors.iteritems():
                logging.warning("{} with {}".format(errorName, error))

        self._sql.close()

    def __executeReproject(self, errors, projections):
        for epsg in projections:
            try:
                epsg = epsg[0]
                reprojectResult = self._db.execute(self.__getTransformSQL(epsg), autocommit=True)
                logging.info("Reproject column SQL result: {}".format(str(reprojectResult)))
                logging.info("Reproject {} to {}".format(epsg, self._epsg))
            except Exception as e:
                logging.error("Error to process '{}': {}".format(epsg, e))
                errors[epsg] = e

    def __executeCreateGeom(self, errors, transectsProj):
        for number, proj in transectsProj.iteritems():
            try:
                result = self._db.execute(self.__getUpdateGeomColumnSQL(number, proj), autocommit=True)
                logging.info("Update geom SQL result: {}".format(str(result)))
                logging.info("The geom of '{}' was updated with projection '{}'".format(number, proj))
            except Exception as e:
                logging.error("Error to process '{}': {}".format(number, e))
                errors[number] = e

    def __getTransectsProj(self):
        transectsProj = {}

        def setTransectEPSG(row):
            if row and len(row) > 0:
                filename = row[0]
                if filename not in transectsProj:
                    try:
                        transect = Transect(self._transects, filename)
                        srs = self.__getSpatialRef(transect)
                        geogcs = srs.GetAttrValue("GEOGCS")
                        datum = srs.GetAttrValue("DATUM")
                        zone = srs.GetUTMZone()
                        transectsProj[transect.number] = self.__getEPSG(filename, zone, geogcs, datum)
                    except Exception as errorEPSG:
                        logging.error(errorEPSG)

        errors = {}
        self._db.forEachData(self.__getTransectFilenameSQL(), setTransectEPSG)
        return errors, transectsProj

    def __getAddGeomColumnSQL(self):
        return "ALTER TABLE {} ADD COLUMN geom geometry(Polygon);".format(self._tablename)

    def __getDistinctEPSGSQL(self):
        return "SELECT DISTINCT(ST_SRID(geom)) FROM {};".format(self._tablename)

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
            -25: "31985"
        }

        return sirgas[zone]

    def __getDropColumnSQL(self):
        return "ALTER TABLE {} DROP COLUMN geom;".format(self._tablename)

    def __getSpatialRef(self, transect):
        driver = ogr.GetDriverByName("ESRI Shapefile")
        path = self.__getTransectBoudingBox(transect)
        if path:
            dataset = driver.Open(path)
            layer = dataset.GetLayer()
            srs = layer.GetSpatialRef()
            dataset.Destroy()

            return srs

    def __getSetSRIDSQL(self):
        return "SELECT UpdateGeometrySRID('public', '{}', 'geom', {});".format(self._tablename, self._epsg)

    def __getTransformSQL(self, epsg):
        return """UPDATE metrics
SET geom = ST_Transform(geom, {})
WHERE ST_SRID(geom) = {};
""".format(self._epsg, epsg)

    def __getTransectBoudingBox(self, transect):
        BASE_NAME_DIR = "T-"
        BASE_NAME_TRANSECT = "POLIGONO_T-"
        BASE_EXTENSION = ".shp"

        transectDirName = BASE_NAME_DIR + transect.number
        originalTransectDir = os.path.join(self._transects, transectDirName)
        if os.path.isdir(originalTransectDir):
            boudingBoxFile = BASE_NAME_TRANSECT + transect.number + BASE_EXTENSION
            for pol_dir in os.listdir(originalTransectDir):
                if self.__isPolygonDir(pol_dir):
                    return os.path.join(originalTransectDir, pol_dir, boudingBoxFile)
        else:
            raise RuntimeError("Directory '{}' not found".format(originalTransectDir))

    def __getTransectFilenameSQL(self):
        return "SELECT DISTINCT({}) FROM {};".format(self._transectfield, self._tablename)

    def __getUpdateGeomColumnSQL(self, number, proj):
        return """UPDATE {0}
SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint({1}, {2}), ST_MakePoint({1} + {3}, {2}), ST_MakePoint({1} + {3}, {2} + {4}), ST_MakePoint({1}, {2} + {4}), ST_MakePoint({1}, {2})])), {5})
WHERE {6} ~ '{7}';
""".format(self._tablename, self._xfield, self._yfield, self._xdim, self._ydim, proj, self._transectfield, number)

    def __hasExtension(self, filename, extension):
        return filename.lower().endswith(extension, -1 * len(extension))

    def __isPolygonDir(self, dirname):
        return dirname.startswith("POLIGONO")

    def __writeCreateGeom(self, errors, transectsProj):
        keys = sorted(transectsProj.keys())
        for number in keys:
            proj = transectsProj[number]
            try:
                self._sql.write(self.__getUpdateGeomColumnSQL(number, proj) + "\n")
                logging.info("Writing 'Update geom' command")
                logging.info("The geom of '{}' was updated with projection '{}'".format(number, proj))
            except Exception as e:
                logging.error("Error to process '{}': {}".format(number, e))
                errors[number] = e

    def __writeReproject(self, errors, projections):
        for epsg in sorted(projections):
            try:
                epsg = epsg[0]
                self._sql.write(self.__getTransformSQL(epsg) + "\n")
                logging.info("Writing 'Reproject column' command")
                logging.info("Reproject {} to {}".format(epsg, self._epsg))
            except Exception as e:
                logging.error("Error to process '{}': {}".format(epsg, e))
                errors[epsg] = e


if __name__ == "__main__":
    try:
        args = UpdateGeom.processCmdLine()
        if args.log:
            logging.basicConfig(filename=args.log, level=logging.INFO)
            logging.getLogger().addHandler(logging.StreamHandler())
        else:
            logging.basicConfig(level=logging.INFO)

        logging.info("Start update..")
        t0 = time.clock()

        db = dbutils(args.ip, args.user, args.password, args.dbname, args.tablespace)
        up = UpdateGeom(args.transects, db, args.tablename, args.transectfield, args.xfield, args.yfield, args.xdim, args.ydim, args.epsg, args.sql)
        if args.sql:
            up.save()
        else:
            up.run()

        logging.info("The column geom was created in {} seconds.".format(time.clock() - t0))
    except Exception as e:
        raise RuntimeError("Unexpected error: {}".format(e))
