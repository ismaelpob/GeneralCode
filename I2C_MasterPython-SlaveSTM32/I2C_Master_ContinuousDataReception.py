import time
import smbus
import struct

##ADDRESS AND I2Cx
I2C_CH                 = 1
DEVICE_ADDRESS         = 0x28
NUMBER_DATA_VAR        = 3
READ_DATA_CMD          = 0xC3

#DATA LENGTH
LENGTH_READ_DATA   = NUMBER_DATA_VAR * 4;

#buffer for read data
buffer_hex = [0x00000000,0x00000000,0x00000000]

#Init 
bus = smbus.SMBus(I2C_CH)
i = 0

while True:
    i = i + 1
    buffer_rx = bus.read_i2c_block_data(DEVICE_ADDRESS,READ_DATA_CMD, LENGTH_READ_DATA)
    
    buffer_hex[0] = (buffer_rx[0]) + (buffer_rx[1] << 8) + (buffer_rx[2] << 16) + (buffer_rx[3] << 24)
    buffer_hex[1] = (buffer_rx[4]) + (buffer_rx[5] << 8) + (buffer_rx[6] << 16) + (buffer_rx[7] << 24)
    buffer_hex[2] = (buffer_rx[8]) + (buffer_rx[9] << 8) + (buffer_rx[10] << 16) + (buffer_rx[11] << 24)
    
    string0 = str(i) + ":"
    string1 = "Data1: " + str(struct.unpack('!f', bytes.fromhex(format(buffer_hex[0], 'x')))[0])
    string2 = " Data2: " + str(struct.unpack('!f', bytes.fromhex(format(buffer_hex[1], 'x')))[0])
    string3 = " Data3: " + str(struct.unpack('!f', bytes.fromhex(format(buffer_hex[2], 'x')))[0])
    
    print(string0 + string1 + string2 + string3)
    
    time.sleep(0.25)

