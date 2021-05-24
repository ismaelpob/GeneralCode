%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%Desing the input signal%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Create a 1 Hz signal
freq=1;
freq2=20;
freq3=80;
F=1;  %1/F=freq=2pi
fs=200; %Samples
t=0:1/fs:F;
signal_1hz = sin(2*pi*freq*t);
signal_10hz = sin(2*pi*freq2*t);
signal_80hz = sin(2*pi*freq3*t);
signal_hz = signal_1hz + signal_10hz + signal_80hz;
plot(signal_hz);

%csvwrite('_signal_1_20-80hz.txt',signal_hz);

%Create a 1Hz signal sampling
%{
%F=1
%Fs=100
%n=0:(Fs)-1;
%xs=sin(2*pi*F*n/Fs);
%stem(n,xs);
%}

%Create a 1Hz and 20 Hz signal. Combine this two signals
%{
freq1=1
freq2=20;
F=2;    %F=freq=2pi
fs=100; %Samples
t=0:1/fs:F;

signal_1hz = sin(2*pi*freq1*t);
signal_20hz = sin(2*pi*freq2*t);
plot(signal_1hz);
signal_20hz_1hz = signal_20hz + signal_1hz;
plot(signal_20hz_1hz);
%}