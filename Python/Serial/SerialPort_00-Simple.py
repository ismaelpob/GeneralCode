#python -m PyQt5.uic.pyuic -x [FILENAME].ui -o [FILENAME].py

import serial as sr
import matplotlib.pyplot as plt
import numpy as np

s = sr.Serial('COM4',9600)
plt.close('all')
plt.figure()
plt.ion()
plt.show()

data = np.array([])
i=0

while i<100:

    a = s.readline()
    a.decode()
    b=float(a)
    data=np.append(data,b)
    plt.cla()
    plt.plot(data)
    plt.pause(0.01)
    i += 1

s.close()

