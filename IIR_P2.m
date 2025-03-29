clc; close all; clear all; 
b= [1 2 1];
a = [1 -0.8  0.64];       
Fs=1000;
% coefficients  
N = 512; % Number of DFT points 
z=abs(freqz(b,a,N,'whole'));  
k=0:Fs/(N-1):Fs; 
plot(k,z) 
title('Magnitude response of the transfer function'); 
xlabel('Frequency(Hz)');
ylabel('magnitude(|H(f)|)'); 
grid on;