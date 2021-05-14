import time
import os.path,csv
from datetime import datetime
from SME_DataLogger import *

def main():

    #Variables and name to use
    data_name = ["x","y"]
    data1=0
    data2=0

    #Initialize SME_DataLogger class, name of data and initial data value
    data_logger = SME_DataLogger(data_name,[data1,data2])

    print(data_logger.data_name)
    print(data_logger.data)

    while data1 < 30:

        ###Update Data for every loop
        data_logger.SME_DataLogger_SaveData([data1,data2])
        
        #Update to new data
        data1+=1
        data2+=10

        print(data_logger.data)
        time.sleep(0.1)
        
    print("end")

if __name__ == "__main__":
    main()
    