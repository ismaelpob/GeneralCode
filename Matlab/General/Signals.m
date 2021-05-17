%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%Desing the input signal%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Create a 20 Hz signal
f1=20;
ts=1/100;
T=2;
t=0:ts:T;
signal_20hz = sin(2*pi*f1*t);
plot(signal_20hz);
%Create a 1 Hz signal
f2=1;
signal_1hz = sin(2*pi*f2*t);
plot(signal_1hz);
%Combine this two signals
signal_20hz_1hz = signal_20hz + signal_1hz;
plot(signal_20hz_1hz);