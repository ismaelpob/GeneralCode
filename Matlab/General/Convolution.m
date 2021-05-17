%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%% Sampling Theorem - Nyquist Theorem %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Fsample >= 2*Fmax 
% This theorem is used for avoid the alias (overlapping frequency windows).
% This make posible the reconstruction of the signal 
%
%   Basics Calculator RC filters
%    http://sim.okawa-denshi.jp/en/CRlowkeisan.htm
%
%   Modified Sallen Key (2 order): 
%       We can used 3 Modified Sallen Key
%       STAGE 1 - STAGE 2 - STAGE 3 (6 Pole Filter)
%       We can make the three filters comon in DSP
%
%   Filters             TimeResp    FreqResp
%       Bessel          Best        Bad
%       Chebyshev       Bad         Best          
%       Butterworth     Medium      Medium
%
%   Each one is used to diferrent performance parameters and are 
%   Constructed by cascading Sallen key configuration.
%   https://www.dspguide.com/graphics/T_3_1.gif
%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%Desing the input signal%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Create a 20 Hz signal
f1=20;
ts=1/100;
T=3;
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

%Save the output signal
csvwrite('_signal_20hz_1hz.txt',signal_20hz_1hz);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%Desing the pulse responce%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%For designt we have the tool Filter design
%for the impulse responce
fdatool
%   Select FIR - Least Squares
%   Fs:100
%   Fpass: 1
%   Fstop: 6
%   Filter Order: 39
%   wpass: 1
%   wstop: 1
%Press: Design Filter and in Impulse Responce
%(Icon with arrrow) we can note the impulse responce. 
%   File - Export
%                Workspace
%                Coeficients
%                Numerator: imp_response
%          Export.
%   The variable is created in the workspace
%
plot(imp_response);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%Convolution of signal%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
output_signal = conv(signal_20hz_1hz,imp_response);
subplot(3,1,1); %3graph, pos 1,1 
plot(signal_20hz_1hz);
title('Noisy Input Signal');
subplot(3,1,2);
plot(imp_response);
title('Impulse Responce');
subplot(3,1,3);
plot(output_signal);
title('Output Convolution');
shg
%The Impulse Responce was design to be a low pass filter for the
%20Hz noise and the convolution gives the clean signal 

