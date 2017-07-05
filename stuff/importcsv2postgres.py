# -*- coding: utf-8 -*-
import argparse
import csv
import os
import sys
import logging
import dbutils


def Header():
    print('Import csv PostGre v0.9')
    print


def ParseCmdLine():
    # G:\TRANSECTS\LAZ\metrics\NP_T-0295.CSV -s localhost -u postgres -p ebaeba18 -t tempimport -d eba -c -sf 3 -nv -
    parser = argparse.ArgumentParser(description='Import CSV to Postgre.')
    parser.add_argument('inputmetric', help='Metric CSV file to be imported.')
    parser.add_argument('inputchm', help='CHM CSV file to be imported.')
    parser.add_argument('-s', '--server', help='server host IP', default='localhost')
    parser.add_argument('-u', '--user', help='Database user name', default='postgre')
    parser.add_argument('-p', '--pwd', help='Password')
    parser.add_argument('-d', '--database', help='Database name')
    parser.add_argument('-t', '--tablename', help='Destination table.')
    parser.add_argument('-c', '--createtable', help=r'Recreate table if it exists.', default=False, action='store_true')
    parser.add_argument('-sf', '--skipfields', type=int, help='Fields to skip when checking null values.', default=0)
    parser.add_argument('-nv', '--nullvalue', help='Null value to be checked', default='')
    parser.add_argument('-v', '--verbose', type=int, help='Show intermediate messages.', default=0)
    parser.add_argument("-l", "--log", type=str, help="Logs to a file. Default 'console'.")

    try:
        return parser.parse_args()
    except:
        print("Unexpected error:", sys.exc_info()[0])
        raise


def key(data, x, y):
    assert isinstance(data, dict)
    return "{},{}".format(str(data[x]), str(data[y]))


def chm(path, nullValue):
    index = "index"
    x = "x"
    y = "y"
    csvValue = "CHM_av"
    value = "chm"
    nlines = 0
    data = {}

    logging.info("Loading CHM '{}' with null value '{}'".format(path, nullValue))
    with open(path, 'r') as f:
        fieldnames = [index, x, y, csvValue]
        reader = csv.DictReader(f, fieldnames=fieldnames)
        header = reader.next()
        # small bug in generated csv: index,x,y,csv0,731725.000,9677075.000,-
        header = header[None]
        if header[2] != nullValue:
            headerValues = {index: '0', x: header[0], y: header[1], value: header[2]}
            data[key(headerValues, x, y)] = headerValues
            nlines += 1

        for line in reader:
            if line[csvValue] != nullValue:
                line[value] = line[csvValue]
                del line[csvValue]
                data[key(line, x, y)] = line
                nlines += 1

    ndata = len(data)
    if nlines != ndata:
        logging.error("Number of lines read({}) is different of number of lines added({})",
                      format(str(nlines), str(ndata)))

    return data


def metric(path, nullValue):
    x = "x"
    y = "y"
    data = {}

    logging.info("Loading METRIC '{}' with null value '{}'".format(path, nullValue))
    with open(path, 'r') as f:
        reader = csv.DictReader(f)
        for line in reader:
            data[key(line, x, y)] = line
    return data


def merge(metrics, chms, nullvalue):
    if len(metrics) <= 0 or len(chms) <= 0:
        logging.error("Error to process 'data'")
        sys.exit(0)

    columnIndex = "index"
    columnX = "x"
    columnY = "y"
    columnCHM = "chm"
    fields = metrics.values()[0].keys()
    fields.append(columnCHM)
    processed = {}

    logging.info("Combine dictionaries 'metrics' with 'chm'")
    for coordinate, metr in metrics.iteritems():
        chmValue = nullvalue
        if coordinate in chms:
            isvalid = False
            ignore = [columnIndex, columnX, columnY, columnCHM]
            for attr, value in metr.iteritems():
                if attr not in ignore and value != nullvalue:
                    isvalid = True
                    break

            ch = chms[coordinate]
            tmpValue = ch[columnCHM]
            if isvalid:
                logging.info("Update coordinate x({}) and y({}) with column '{}' = {}".format(ch[columnX], ch[columnY], columnCHM, tmpValue))
                chmValue = tmpValue
            else:
                logging.error("Coordinate x({}) and y({}) with index({}) has only CHM({}) value".format(ch[columnX], ch[columnY], ch[columnIndex], tmpValue))
            processed[coordinate] = True
        metr[columnCHM] = chmValue

    lenCHM = len(chms)
    lenProcessed = len(processed)
    if lenCHM != lenProcessed:
        logging.error("Has {} values that only exists in CHM".format(lenCHM - lenProcessed))
        for coord, ch, in chms.iteritems():
            if coord not in processed:
                logging.warning("Coordinate x({}) and y({}) with index({}) does not exist in metric, got CHM {}".format(ch[columnX], ch[columnY],ch[columnIndex], ch[columnCHM]))

    return fields, metrics.values()


def load(mpath, cpath, nullvalue):
    fields, metrics = merge(metric(mpath, nullvalue), chm(cpath, nullvalue), nullvalue)
    return sorted(fields), metrics


if __name__ == '__main__':
    # C:\Anaconda\envs\geo\python.exe "E:\heitor.guerra\PycharmProjects\pyLiDARForest\stuff\_importcsv2postgres.py" "G:\Mapa_Biomassa_EBA\Processos_T_LIDAR\METRICAS_all\CSV\lascanopy_CSV\NP_T-0092_dn_g_n_ch1_5.csv" "E:\heitor.guerra\CHM_50m_csv\1\NP_T-0092_dn_g_n_ch1_5.csv" -s localhost -u postgres -p ebaeba18 -t metrics -d eba -sf 3 -nv -
    Header()
    args = ParseCmdLine()
    if args.log:
        logging.basicConfig(filename=args.log, level=logging.INFO)
        logging.getLogger().addHandler(logging.StreamHandler())
    else:
        logging.basicConfig(level=logging.INFO)

    db = dbutils.dbutils(args.server, args.user, args.pwd, args.database, 'pg_default')
    fieldnames, data = load(args.inputmetric, args.inputchm, args.nullvalue)

    db.initsqlvalidfieldnames(fieldnames)
    if (args.createtable):
        db.createtable(args.tablename, fieldnames, data, args.skipfields, args.nullvalue)
    added = db.addrecs(args.tablename, fieldnames, data, args.skipfields, args.nullvalue)
    db.execute("UPDATE {0} SET filename = '{1}' WHERE filename IS NULL".format(args.tablename, os.path.basename(args.inputmetric)), True)
    logging.info('File {0} imported, {1} lines processed, {2} recs added'.format(args.inputmetric, len(data), added))

