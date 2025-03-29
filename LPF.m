clc; close all; clear all; 
M=28;N=2*M+1;                
tw=1000;Fs=10000;   
f=2000+tw/2; % fp(ideal) 
Ts=1/Fs;n=-M:M; 
% w=window(@hamming,N); % Hamming window 
w=window(@blackman,N); 
%w=window(@rectwin,N); 
wp=2*pi*f; 
h = zeros(1, N); 
h=sin(wp.*n.*Ts)./(n*pi); 
h(round(length(h)/2)) = wp*Ts/pi;     
hn=w'.*h;   
%Impulse response 
  
Np=20480; 
Y=abs(fft(hn,N)); 
 
f=0:Fs/(N-1):Fs; 
figure; 
plot(f,Y);title('Magnitude Response of the LPF') 
axis([0 Fs/2,0.999 1.001]);
xlabel('f(Hz)');
ylabel('|H(f)|');
grid on