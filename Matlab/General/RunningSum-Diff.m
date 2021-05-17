%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%% Load input signal %%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

input_signal= load('_signal_20hz_1hz.txt');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%  Running sum  %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
output_signal= cumsum(input_signal);
subplot(2,1,1);
plot(input_signal,'r');
title('Input Signal');
subplot(2,1,2);
plot(output_signal,'g');
title('Output Signal from running sum');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% First Difference %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
output_signal= diff(input_signal);
subplot(2,1,1);
plot(input_signal,'r');
title('Input Signal');
subplot(2,1,2);
plot(output_signal,'g');
title('Output Signal from first difference');