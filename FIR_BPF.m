clc; close all; clear all; 
M=36;N=2*M+1;                 
tw=750;
Fs=16000;           
f1=3000+750/2;
f2=2000-750/2; 
Ts=1/Fs;
n=-36:36; 
w=window(@hamming,N);   
w1=2*pi*f1; 
w2=2*pi*f2; 
h1 = zeros(1, N); 
h1=sin(w1.*n.*Ts)./(n*pi); 
h1(round(length(h1)/2)) = w1*Ts/pi;     
h2 = zeros(1, N); 
h2=sin(w2.*n.*Ts)./(n*pi); 
h2(round(length(h2)/2)) = w2*Ts/pi;  
h=h1-h2; 
hn1=w'.*h1; 
hn2=w'.*h2; 
hn=hn1-hn2;  
N=20480; 
Y=abs(fft(hn,N)); 
f=0:Fs/(N-1):Fs; 
figure; 
plot(f,Y);title('Magnitude Response of the BPF') 
axis([0 Fs/2,0 1.1]);xlabel('f(Hz)');ylabel('|H(f)|');grid on
