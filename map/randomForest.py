import sys
import os
import glob
import h2o
from h2o.estimators import H2ORandomForestEstimator
import psycopg2
import time
from datetime import timedelta
import shutil
import argparse
import smtplib

def ProcessCmdLine():
    parser = argparse.ArgumentParser(description="Generate randomForest maps.")
    parser.add_argument("-mv", "--mapversion", type=str, help="Map version.",required=True)
    parser.add_argument("-mp", "--modelpath", type=str, help="Path to save models.",required=True)
    parser.add_argument("-csvtt", "--csvtraintest", type=str, help="Input file.",required=True)
    parser.add_argument("-ct", "--createtablescript", type=str, help="Script to create results table.",required=True)
    parser.add_argument("-cs", "--dbconnstr", type=str, help="Connection string.",required=True)
    parser.add_argument("-pf", "--predictionfiles", type=str, help="Files containing prediction data.",required=True)
    parser.add_argument("-ip", "--intermediatepath", type=str, help="Where to put export predicted data.",required=True)
    parser.add_argument("-dp", "--destinationpath", type=str, help="Where to put results.",required=True)
    parser.add_argument("-yc", "--ycolumn", type=str, help="Y (prediction) column.",required=True)
    parser.add_argument("-ep", "--exportparts", type=int, help="Export parts.",required=True)
    parser.add_argument("-rf", "--resultfields", type=str, help="Result fields to be exported.",required=True)
    parser.add_argument("-tc", "--trainingcolumns", type=str, help="Trainning columns.",required=True)
    parser.add_argument("-cm", "--createmodel", action='store_true')
    parser.add_argument("-sm", "--savemodel", action='store_true')
    parser.add_argument("-rct", "--recreatetable", action='store_true')
    parser.add_argument("-ev", "--estimatevalues", action='store_true')
    parser.add_argument("-ur", "--uploadrsults", action='store_true')
    parser.add_argument("-pp", "--postprocessing", action='store_true')
    parser.add_argument("-cat", "--categoricaly", action='store_true')
    return parser.parse_args()

def createpathifnotexists(path):
    if not os.path.exists(path):
        os.makedirs(path)

def addbackslash(path):
    if not path.endswith(os.path.sep):
        path += os.path.sep
    return path

def sendMail(message):
    conn = smtplib.SMTP('smtp.gmail.com', 587)
    conn.ehlo()
    conn.starttls()
    conn.login('assismauro64@gmail.com', 'Hibisco@12')
    conn.sendmail('assismauro64@gmail.com', 'assismauro64@gmail.com', message)
    conn.quit()

def csvPredictedNames(predicteddestination, csvpredicts):
    ret = []
    for csvpredict in csvpredicts:
        filename_w_ext = os.path.basename(csvpredict)
        filename, extension = os.path.splitext(filename_w_ext)
        ret.append(predicteddestination + '\\' + filename + '_predicted' + extension)
    return ret

def recreateTable(createscript, connstr, desttable, ycolumn, ydatatype):
    f=open(createscript)
    createdesttable=f.read()
    f.close()
    conn = psycopg2.connect(connstr)
    cur = conn.cursor()

    print('Re-creating table {0}'.format(desttable))
    cur.execute('DROP TABLE IF EXISTS {0}'.format(desttable))

    cur.execute(createdesttable.format(desttable,ycolumn,ydatatype))
    conn.commit()
    conn.close()
    print('Table created.')

def importResults(connstr, inputfname, tablename, fieldlist):
    conn = psycopg2.connect(connstr)
    cur = conn.cursor()

    with open(inputfname, 'r') as fin:
        head, tail = fin.read().split('\n', 1)
        if not head[0][0].isdigit():
            with open(inputfname, 'w') as fout:
                fout.write(tail)
                fout.close()

    f = open(inputfname, 'r')
    sql = "COPY {0} ({1}) from '{2}' CSV".format(tablename, fieldlist, inputfname)
    cur.execute(sql)
    conn.commit()
    conn.close()

if __name__ == "__main__":
    args=ProcessCmdLine()

    desttable = 'amazon_v'+args.mapversion

    if args.recreatetable:
        recreateTable(args.createtablescript, args.dbconnstr, desttable, args.ycolumn, 'DOUBLE PRECISION' if (not args.categoricaly) else 'VARCHAR(10)')

    h2o.init(max_mem_size="30G")  # specify max number of bytes. uses all cores by default.
    h2o.remove_all()  # clean slate, in case cluster was already running
    start = time.time()

    csvpredict = glob.glob(args.predictionfiles)
    csvpredicted = csvPredictedNames(args.intermediatepath, csvpredict)

    rfmodel = None
    if args.createmodel:
        modelingdata = h2o.import_file(args.csvtraintest)
        print("Modeling data loaded: {0}".format((timedelta(seconds=time.time() - start))))
        print("Modeling data length: {0}".format(len(modelingdata)))

    # Split data into train and testing
        train, test = modelingdata.split_frame(ratios=[0.75],seed=142857)

        rfmodel = H2ORandomForestEstimator(
            model_id=args.mapversion+'.rfm',
            ntrees=150,
            max_depth=20,
            nfolds=0,
            min_rows=20,
            seed=142857)

        rfmodel.train(x=args.trainingcolumns.split(','), y=args.ycolumn, training_frame=train)
        print("Train: {0}".format((timedelta(seconds=time.time() - start))))
        print("Score History:")
        print(rfmodel.score_history())
        performance = rfmodel.model_performance(test_data=test)
        print("Performance: {0}".format((timedelta(seconds=time.time() - start))))

        print(performance)

        print("RMSE")
        print(rfmodel.model_performance(test_data=train).rmse())
        print(rfmodel.model_performance(test_data=test).rmse())

        print("R2")
        print(rfmodel.model_performance(test_data=train).r2())
        print(rfmodel.model_performance(test_data=test).r2())

        print("Stats: {0}".format((timedelta(seconds=time.time() - start))))

        if args.savemodel:
            h2o.save_model(rfmodel, addbackslash(args.modelpath), force=True)

    else:
        print('Loading model...')
        rfmodel = h2o.load_model(addbackslash(args.modelpath)+args.mapversion+'.rfm')

    print()

    if args.estimatevalues:

        for input, output in zip(csvpredict, csvpredicted):
            newdirname = output.replace('.csv', '_csv')
            try:
                shutil.rmtree(output)
            except:
                pass
            try:
                shutil.rmtree(newdirname)
            except:
                pass
            print('****************************************************')
            print("*** Estimating {0}...".format(input))
            print('****************************************************')
            predictiondata = h2o.import_file(input)
            print("Prediction data loaded: {0}".format((timedelta(seconds=time.time() - start))))
            print("Prediction data length: {0}".format(len(predictiondata)))

            predictions = rfmodel.predict(predictiondata)
            print("Predicted: {0}".format((timedelta(seconds=time.time() - start))))
#            print("Prediction R2: {0}".format(rfmodel.model_performance(test_data=predictiondata).r2()))
#            print("Prediction RMSE: {0}".format(rfmodel.model_performance(test_data=predictiondata).rmse()))

            predictiondata[args.ycolumn] = predictions['predict']
            predictiondata=predictiondata[:,args.resultfields.split(',')]
            h2o.export_file(predictiondata, output, force=True, parts=args.exportparts)

            print("Saved: {0}".format((timedelta(seconds=time.time() - start))))

            predictiondata = None

            if os.path.isdir(output):
                os.rename(output, newdirname)
            fnames = os.listdir(newdirname)

            if args.uploadrsults:
                for fname in fnames:
                    fullname = r'{0}\{1}'.format(newdirname, fname)
                    print('Importing {0} ...'.format(fullname))
                    importResults(args.dbconnstr,
                                  fullname,
                                  desttable,
                                  args.resultfields)
                print("Imported: {0}".format((timedelta(seconds=time.time() - start))))

        if args.postprocessing:
            print("Starting post-processing: {0}".format((timedelta(seconds=time.time() - start))))
            conn = psycopg2.connect(args.dbconnstr)
            cur = conn.cursor()
            if args.recreatetable:
                cur.execute(r'CREATE INDEX "{0}_xy_idx" ON "public"."{0}" USING btree( "x" Asc NULLS Last, "y" Asc NULLS Last );'.format(desttable))
                print("Index created: {0}".format((timedelta(seconds=time.time() - start))))
            destdir='{0}v{1}'.format(addbackslash(args.destinationpath),args.mapversion)
            if not os.path.exists(destdir):
                os.makedirs(destdir)
            sql = r"COPY (SELECT fid,x,y,{2} FROM {0} order by x,y) to '{1}\{0}.csv' CSV HEADER;".format(desttable,destdir,args.ycolumn if not args.categoricaly else 'ascii({0})-64 {0}'.format(args.ycolumn))
            print("Exporting: {0}".format(sql))
            cur.execute(sql)
            conn.commit()
            conn.close()
            print("End export csv map: {0}".format((timedelta(seconds=time.time() - start))))
    sendMail('End of processing: {0}'.format(desttable))

    print('*************** DONE! EEEEBBBAAAAAAAAAAA... *****************')
    print("End: {0}".format((timedelta(seconds=time.time() - start))))
    h2o.cluster().shutdown()
