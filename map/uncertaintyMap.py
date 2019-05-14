import sys
import os
import glob
import h2o
from h2o.estimators import H2ORandomForestEstimator
import time
from datetime import timedelta
import shutil
import argparse
import smtplib
from email.mime.text import MIMEText
import numpy as np
import pandas as pd
import random
import gc

def ProcessCmdLine():
    parser = argparse.ArgumentParser(description="Generate randomForest maps.")
    parser.add_argument("-h2o", "--h2oserver", type=str, help="H2O server IP.", default="127.0.0.1")
    parser.add_argument("-fbc", "--firstbiomasscolumn", type=int, help="First biomass column to process.", default=-1)
    parser.add_argument("-lbc", "--lastbiomasscolumn", type=int, help="Last biomass column to process.", default=-1)
    parser.add_argument("-ott", "--originaltraintest", type=str, help="Input file.")
    parser.add_argument("-csvtt", "--csvtraintest", type=str, help="Input file.",required=True)
    parser.add_argument("-cbv", "--createbiomassvalues",  action='store_true', help="If true, create new biomass values.")
    parser.add_argument("-pf", "--predictionfile", type=str, help="File containing prediction data.",required=True)
    parser.add_argument("-df", "--destinationfile", type=str, help="Where to put results.",required=True)
    parser.add_argument("-tc", "--trainingcolumns", type=str, help="Trainning columns.",required=True)
    parser.add_argument("-yf", "--ycolumn", type=str, help="Y (prediction) column.",required=True)
    parser.add_argument("-uc", "--uncertaintycolumn", type=str, help="Uncertainty column.",required=True)
    parser.add_argument("-ep", "--exportparts", type=int, help="Export parts.",required=True)
    parser.add_argument("-ns", "--numberofsimulations", type=int, help="Number of simulations.",required=True)
    parser.add_argument("-si", "--savinginterval", type=int, help="Saving interval, in biomass columns.",required=True)
    args=parser.parse_args()
    if (args.firstbiomasscolumn == -1) and (args.lastbiomasscolumn != -1) or (args.firstbiomasscolumn != -1) and (args.lastbiomasscolumn == -1):
        raise ValueError("It´s necessary to specify lastbiomasscolumn AND firstbiomasscolumn, or none")
    return args

def createpathifnotexists(path):
    if not os.path.exists(path):
        os.makedirs(path)

def addbackslash(path):
    if not path.endswith(os.path.sep):
        path += os.path.sep
    return path


def send_email(user, pwd, recipient, subject, body):

    FROM = user
    TO = recipient if isinstance(recipient, list) else [recipient]
    SUBJECT = subject
    TEXT = body

    # Prepare actual message
    message = """From: %s\nTo: %s\nSubject: %s\n\n%s
    """ % (FROM, ", ".join(TO), SUBJECT, TEXT)
    try:
        server = smtplib.SMTP("smtp.gmail.com", 587)
        server.ehlo()
        server.starttls()
        server.login(user, pwd)
        server.sendmail(FROM, TO, message)
        server.close()
        print('successfully sent the mail')
    except Exception as e:
        print("failed to send mail: " + str(e))


def createUncertaintyValues(h2oframe,n,destination):
    dataframe = h2oframe.as_data_frame()
    for i in range(n):
        fieldname='biomass' + str(i)
        if (i % 100) == 0:
            print(i)
        dataframe[fieldname] = pd.Series(np.random.normal(dataframe[args.ycolumn].values,
                                                                    dataframe[args.uncertaintycolumn].values))
        dataframe.loc[dataframe[fieldname] < 0,  fieldname] = 0
    dataframe.to_csv(destination,index=False)

def starth2o(h2oserver):
    h2o.init(ip=h2oserver, max_mem_size="28G")  # specify max number of bytes. uses all cores by default.
    h2o.no_progress()
    h2o.remove_all()  # clean slate, in case cluster was already running

def loadInpuData(csvtraintest,predictionfile):
    modelingdata = h2o.import_file(path=csvtraintest)
    print("Modeling data loaded: {0}".format((timedelta(seconds=time.time() - start))))
    print("Modeling data length: {0}".format(len(modelingdata)))

    predictiondata = h2o.import_file(predictionfile)
    print("Prediction data loaded: {0}".format((timedelta(seconds=time.time() - start))))
    print("Prediction data length: {0}".format(len(predictiondata)))

    return modelingdata, predictiondata

#if __name__ == "__main__":
randomSeed = 142857

args=ProcessCmdLine()
a=''
for arg in vars(args):
   a=a+str(getattr(args, arg))+'\r\n'
send_email('assismauro64@gmail.com','********','assismauro64@gmail.com','Iniciando processamento',a)

firstbiomasscolumn=args.firstbiomasscolumn if args.firstbiomasscolumn > -1 else 0
lastbiomasscolumn=args.lastbiomasscolumn if args.lastbiomasscolumn > -1 else args.numberofsimulations

desttable = 'uncertainty'

start = time.time()

starth2o(args.h2oserver)

if args.createbiomassvalues:
    modelingdata = h2o.import_file(args.originaltraintest)
    createUncertaintyValues(modelingdata,args.numberofsimulations,args.csvtraintest)
    print("Shuffle target values created: {0}".format((timedelta(seconds=time.time() - start))))
    sys.exit()

modelingdata, predictiondata = loadInpuData(args.csvtraintest, args.predictionfile)

trainingcolumns = args.trainingcolumns.split(',')

uncertainty = None

random.seed(randomSeed)
randomNumbers = [int(sys.maxsize*random.random()) for i in range(1000)]

for i in range(firstbiomasscolumn,lastbiomasscolumn):

    print('****************************************************')
    print("*** Simulation no. {0}...".format(i))
    print('****************************************************')

    biomasscolumn = 'biomass' + str(i)

    train, test = modelingdata.split_frame(ratios=[0.75], seed=randomNumbers[i])

    rfmodel = H2ORandomForestEstimator(
        model_id='uncertainty',
        ntrees=150,
        max_depth=20,
        nfolds=0,
        min_rows=20,
        seed=randomNumbers[i])
    try:
        rfmodel.train(x=trainingcolumns, y=biomasscolumn, training_frame=train)
    except h2o.exceptions.H2OValueError as e:
        print("======================================================== Error in simulation {0}\r\n{1}\r\n{1}".format(i,sys.exc_info()[0],e))
        continue
    except Exception as e:
        print("======================================================== Error in simulation {0}\r\n{1}\r\n{1}".format(i,sys.exc_info()[0],e))
        continue
    print("Train: {0}".format((timedelta(seconds=time.time() - start))))
    '''
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
    '''
    predictions = rfmodel.predict(predictiondata)
    print("predicted: {0}".format((timedelta(seconds=time.time() - start))))

    if (uncertainty is None):
        uncertainty=predictiondata[:,['fid','x','y']]
        uncertainty['sum']=0.0
    print("Updating : {0}".format((timedelta(seconds=time.time() - start))))
    uncertainty[biomasscolumn] = predictions
    uncertainty['sum']+=predictions
    if ((i + 1) % args.savinginterval) == 0:
        resultsdestination = args.destinationfile.replace('.csv', '{0}_csv'.format(i)) if args.exportparts > 1 else args.destinationfile
        try:
            shutil.rmtree(resultsdestination)
        except:
            pass
        h2o.export_file(uncertainty, resultsdestination, force=True, parts=args.exportparts)
        secs=time.time() - start
        send_email('assismauro64@gmail.com', '******','assismauro64@gmail.com', 'Exportando arquivo...',
                   resultsdestination+'\r\n'+str(i)+'\r\n'+str(timedelta(seconds=secs))+'\r\n'+str(secs/i)+'\r\n'+
                   str(timedelta(seconds=(secs/i)*(lastbiomasscolumn-i))))
        uncertainty = None
        print("Stoping/starting: {0}".format((timedelta(seconds=time.time() - start))))
        h2o.remove_all()
        collected=gc.collect()
        print("Collected {0} objects.".format(collected))
        print("Reloading: {0}".format((timedelta(seconds=time.time() - start))))
        modelingdata, predictiondata = loadInpuData(args.csvtraintest, args.predictionfile)
        print("Reloaded: {0}".format((timedelta(seconds=time.time() - start))))
try:
    shutil.rmtree(args.destinationfile)
except:
    pass
if not (uncertainty is None):
    h2o.export_file(uncertainty, args.destinationfile, force=True, parts=args.exportparts)
    print("Saved: {0}".format((timedelta(seconds=time.time() - start))))
print('*************** DONE! EEEEBBBAAAAAAAAAAA... *****************')
print("End: {0}".format((timedelta(seconds=time.time() - start))))
h2o.cluster().shutdown()
