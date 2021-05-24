%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%Desing the input signal%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Create a 1 Hz signal
freq1=1;
freq2=100;
freq3=1000;
freq4=5000;
freq5=10000;
noise_scale=0.3;
F=1;  %1/F=freq=2pi
fs=21000; %fs > 2 *10k (1.1)
t=0:1/fs:F-1/fs;
signal_1hz = sin(2*pi*freq1*t);
signal_100hz = noise_scale*sin(2*pi*freq2*t);
signal_1khz = noise_scale*sin(2*pi*freq3*t);
signal_5khz = noise_scale*sin(2*pi*freq4*t);
signal_10khz = noise_scale*sin(2*pi*freq5*t);
signal_hz = signal_1hz + signal_100hz + signal_1khz + signal_5khz + signal_10khz;
rms(signal_hz)
dfs_output = fft(signal_hz);
dfs_output_mag = abs(dfs_output);
idft_output = ifft(dfs_output);
subplot(3,1,1);
plot(signal_hz,'r');
title('Input Signal');
subplot(3,1,2);
plot(dfs_output_mag,'b');
title('Frecuency Spectrum');
subplot(3,1,3);
plot(idft_output,'g');
title('Signal from IDFT');
csvwrite('_signal_sin10khz.txt',signal_hz);