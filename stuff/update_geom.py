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
        parser.add_argument("-yf", "--yfield", type=str, help="Y field name. Default 'y'.")
        parser.add_argument("-xd", "--xdim", type=int, help="X dimension. Default '5000'.")
        parser.add_argument("-yd", "--ydim", type=int, help="Y dimension. Default '5000'.")
        parser.add_argument("-e", "--epsg", type=int, help="EPSG of new column. Default '4674'.")
        parser.add_argument("-l", "--log", type=str, help="Logs to a file. Default 'console'.")

        args = parser.parse_args()
        if not os.path.isdir(args.transects):
            raise RuntimeError("Directory '{}' not found".format(args.transects))
        return args

    def __init__(self, transectsPath, db,tableName="metrics", transenctField="filename", xfield="x", yfield="y", xdim=5000, ydim=5000,
                 epsg=4674, log=None):
        if not transectsPath:
            raise RuntimeError("Argument 'transectsPath' is mandatory.")

        if log:
            logging.basicConfig(filename=log, level=logging.INFO)
        else:
            logging.basicConfig(level=logging.INFO)

        self._db = db
        self._transectsPath = transectsPath
        self._tableName = tableName
        self._transectField = transenctField
        self._xfield = xfield
        self._yfield = yfield
        self._xdim = xdim
        self._ydim = ydim
        self._epsg = epsg

    def run(self):
        schema = self._db.getTableSchema(self._tableName)
        if "geom" in schema:
            dropResult = self._db.execute(self.__getDropColumnSQL(), autocommit=True)
            logging.info("Drop column SQL result: {}".format(str(dropResult)))

        addResult = self._db.execute(self.__getAddGeomColumnSQL(), autocommit=True)
        logging.info("Add column SQL result: {}".format(str(addResult)))

        errors = self.updateGeom()

        setSRIDResult = self._db.execute(self.__getSetSRIDSQL(), autocommit=True)
        logging.info("Set SRID SQL result: {}".format(str(setSRIDResult)))

        if len(errors) > 0:
            logging.warning("Files with problems: ")
            for filename, error in errors.iteritems():
                logging.warning("{} with {}".format(filename, error))

    def updateGeom(self):
        transectsProj = {}

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

        errors = {}
        self._db.forEachData(self.__getTransectFilenameSQL(), setTransectEPSG)
        for filename, proj in transectsProj.iteritems():
            try:
                result = self._db.execute(self.__getUpdateGeomColumnSQL(filename, proj), autocommit=True)
                logging.info("Update geom SQL result: {}".format(str(result)))
                logging.info("The geom of '{}' was updated with projection '{}'".format(filename, proj))
            except Exception as e:
                logging.error("Error to process '{}': {}".format(filename, e))
                errors[filename] = e
        projections = self._db.getdata(self.__getDistinctEPSGSQL())
        for epsg in projections:
            try:
                epsg = epsg[0]
                reprojectResult = self._db.execute(self.__getTransformSQL(epsg), autocommit=True)
                logging.info("Reproject column SQL result: {}".format(str(reprojectResult)))
                logging.info("Reproject {} to {}".format(epsg, self._epsg))
            except Exception as e:
                logging.error("Error to process '{}': {}".format(epsg, e))
                errors[epsg] = e
        return errors

    def __getAddGeomColumnSQL(self):
        return "ALTER TABLE {} ADD COLUMN geom geometry(Polygon);".format(self._tableName)

    def __getDistinctEPSGSQL(self):
        return "SELECT DISTINCT(ST_SRID(geom)) FROM {};".format(self._tableName)

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

    def __getDropColumnSQL(self):
        return "ALTER TABLE {} DROP COLUMN geom;".format(self._tableName)

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
        return "SELECT UpdateGeometrySRID('public', '{}', 'geom', {});".format(self._tableName, self._epsg)

    def __getTransformSQL(self, epsg):
        return """
        UPDATE metrics
        SET geom = ST_Transform(geom, {})
        WHERE ST_SRID(geom) = {};
        """.format(self._epsg, epsg)

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

    def __getTransectFilenameSQL(self):
        return "SELECT DISTINCT({}) FROM {};".format(self._transectField, self._tableName)

    def __getUpdateGeomColumnSQL(self, filename, proj):
        return """
           UPDATE {0}
           SET geom = ST_SetSRID(ST_MakePolygon(ST_MakeLine(ARRAY[ST_MakePoint({1}, {2}), ST_MakePoint({1} + {3}, {2}), ST_MakePoint({1} + {3}, {2} + {4}), ST_MakePoint({1}, {2} + {4}), ST_MakePoint({1}, {2})])), {5})
           WHERE {6} = '{7}';
           """.format(self._tableName, self._xfield, self._yfield, self._xdim, self._ydim, proj, self._transectField,
                      filename)

    def __hasExtension(self, filename, extension):
        return filename.lower().endswith(extension, -1 * len(extension))

    def __isPolygonDir(self, dirname):
        return dirname.startswith("POLIGONO")


if __name__ == "__main__":
    try:
        logging.info("Start update..")
        t0 = time.clock()

        args = UpdateGeom.processCmdLine()
        db = dbutils(args.ip, args.user, args.password, args.dbname, args.tablespace)
        up = UpdateGeom(transectsPath=args.transects, db=db, tableName=args.tablename, transenctField=args.transectfield, xfield=args.xfield,
                        yfield=args.yfield, xdim=args.xdim, ydim=args.ydim, epsg=args.epsg, log=args.log)
        up.run()

        logging.info("The column geom was created in {} seconds.".format(time.clock() - t0))
    except Exception as e:
        raise RuntimeError("Unexpected error: {}".format(e))
