% --------------------
% File: A.m
% Analysis of a second order low pass filter 
% --------------------
% First clear workspace 
clear all; 
close all; 
clc; 

% --- Define filter coefficients 
b = [0.079 2*0.079 0.079];          % Numerator 
a = [1 -1.2 0.516];                 % Denominator 

% ---------------------------------------------------- 
%% --- Impulse response  
% ---------------------------------------------------- 
% --- Overall parameters 
N = 32; 
n = 0:N-1;
% --- Define impulsion 
delta = [1; zeros(N-1,1)];  
% --- Define step 
step = ones(N,1);    
% --- Get the impulse response 
h = filter(b, a, delta);   
% --- Plot the impulse response 
figure(1); stem(n,h);
ylabel("amplitude");
xlabel("n");
title("Impulse response of the filter");
% ---------------------------------------------------- 
%% --- Frequency response  
% ---------------------------------------------------- 
% --- Define size 
L = 256;
% --- Getting filter response 
[h,w] = freqz(b,a,L);  
% --- Get magnitude and phase 
m = abs(h);
p = angle(h);
% Plotting the result 
% Magnitude - 1 
figure(2); 
plot(20*log10(m));
xlabel("pulsation in rad/s");
ylabel("amplitude of filter in dB");
title('Log magnitude of the IIR filter (no xaxis)');
% Magnitude - 2 
figure(3); 
plot(w(1:L-1),20*log10(m(1:L-1))); 
title('Log Magnitude of the second order IIR Filter'); 
xlabel("normalized pulsation");
ylabel("amplitude of filter in dB");
axis([0 pi -60 2]); grid 
% --- Linear scale and phase 
figure(4);
subplot(2,1,1);
plot(w,m);
xlabel("normalized pulsation");
ylabel("amplitude of filter");
title('Magnitude'); 
subplot(2,1,2);
plot(w,p);
xlabel("normalized pulsation");
ylabel("phase of filter in degrees");
title('Phase');
% Plotting zeros and poles
figure(6); zplane(b,a); 
title("The poles of the second order  filter");
zero = roots(b); pole = roots(a);
% ---  Plotting the template
Delta1 = 1; Delta2 = -20; 
Fe = 10000; 
Fp = 1000; NFp = round(L*Fp/(Fe/2)); 
Fa = 3000; NFs = round(L*Fa/(Fe/2)); 
gabh = [Delta1*ones(NFs,1); Delta2*ones(L-NFs,1)]; 
gabl = [-Delta1*ones(NFp,1); -5000*ones(L-NFp,1)]; 
figure(3); hold on; plot(w,gabh,'r'); plot(w,gabl,'r'); legend('magnitude', 'template of filter');
