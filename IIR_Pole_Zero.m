clc; close all; clear all; 
%y[n]=1.25y[n-1]-0.78125y[n-2]+x[n]+2x[n-1]+x[n-2] 
b= [1 2 1];a = [1 -0.8  0.64];       
% (a) 
% coefficients  
H= tf(b,a,1/10^4,'variable','z^-1')   % Transfer function  
% (b) 
[zero,pole] = tf2zp(b,a) 
% (c) 
figure; 
zplane(b,a); 
grid on 
% fm and BW 
Fs=10000; 
%(d) 
r=abs(pole(1,1))      
% (e) 
% Distance of pole from the origin  
T=angle(pole(1,1)) % angle of the pole in radian 
% (f) 
fm =(Fs/(2*pi))*T  % Frequency of maximum magnitude  
%(g) 
BWr=2*(abs(1-r)./sqrt(r)); % BW of the filter in radian 
BW=(Fs/(2*pi))*BWr        % BW of the filter in hertz
