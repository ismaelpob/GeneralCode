import time
import os.path,csv
from datetime import datetime

data_name = ["x","y"]
data = [[]]

def main():
    #Variables a guardar.

    print("init")
    data1=0
    data2=0

    currentDate = datetime.now().strftime('%Y_%m_%d')

    data = [data_name,[data1,data2]]
    
    print(data[0])

    while data1 < 30:

        ###Update Data
        #Update time
        if(currentDate != datetime.now().strftime('%Y_%m_%d')):
            currentDate = datetime.now().strftime('%Y_%m_%d')
        #Update buffer of data
        data[1] = [data1,data2]

        #Create folder if not exist
        if not os.path.exists("Logger"): os.mkdir("Logger")
        if not (os.path.isfile('Logger/'+currentDate+'.csv')):
            with open('Logger/'+currentDate+'.csv','w',newline='') as csvfile:
                #Create a file if not exist
                fileWriter = csv.writer(csvfile,delimiter=',')
                fileWriter.writerow(data[0])
        #Save data in file
        with open('Logger/'+currentDate+'.csv','a+',newline='') as csvfile:
            fileWriter = csv.writer(csvfile,delimiter=',')
            fileWriter.writerow(data[1])
        
        #Update change data
        data1+=1
        data2+=10

        print(data[1])
        time.sleep(0.1)
        
    print("end")

if __name__ == "__main__":
    main()