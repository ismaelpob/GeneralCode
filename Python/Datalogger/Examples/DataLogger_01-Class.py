import time
import os.path,csv
from datetime import datetime

class SME_DataLogger:
    def __init__(self,in_data_name,in_data):

        self.data = []
        self.data_name = []
        self.data = in_data
        self.data_name = in_data_name

        #Get Datatime
        self.currentDate = datetime.now().strftime('%Y_%m_%d')

        #Create folder if not exist
        if not os.path.exists("Logger"): os.mkdir("Logger")
        if not (os.path.isfile('Logger/'+ self.currentDate+'.csv')):
            with open('Logger/'+ self.currentDate+'.csv','w',newline='') as csvfile:
                #Create a file if not exist
                fileWriter = csv.writer(csvfile,delimiter=',')
                fileWriter.writerow(self.data_name)

    def SME_DataLogger_SaveData(self,in_data):
        #Save data in file
        self.data = in_data
        with open('Logger/'+ self.currentDate +'.csv','a+',newline='') as csvfile:
            fileWriter = csv.writer(csvfile,delimiter=',')
            fileWriter.writerow(self.data)

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
    