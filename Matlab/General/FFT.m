%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Load input signal %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Signal example created by Convolution.m
% in "Desing the input signal"
input_signal= load('_signal_20hz_1hz.txt');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%  FFT and IDFT %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
dfs_output = fft(input_signal);
dfs_output_mag = abs(dfs_output);
idft_output = ifft(dfs_output);
subplot(3,1,1);
plot(input_signal,'r');
title('Input Signal');
subplot(3,1,2);
plot(dfs_output_mag,'y');
title('Frecuency Spectrum');
subplot(3,1,3);
plot(idft_output,'g');
title('Signal from IDFT');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%  MAG and ANGL %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
Y=fft(input_signal);
Ymag=abs(Y);
Yphase=unwrap(angle(Y));
subplot(3,1,1);
plot(input_signal,'r');
title('Input Signal');
subplot(3,1,2);
plot(Ymag,'y');
title('Ymag');%0-150, 1Hz and 25Hz peak
subplot(3,1,3);
plot(Yphase,'g');
title('Yphase');

