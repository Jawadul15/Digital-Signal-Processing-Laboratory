clc; close all, clear all;
Fs=1000; T=1/Fs;
F1=100; F2=50;
n=0:1:Fs/2-1;
s1=cos(2*pi*F1*n*T);
s2=cos(2*pi*F2*n*T)
s=s1+s2;
h=[1 -1.9021130326 1];
N=Fs/2;
df=1/(N*T);
f=n*df;
FFTs1=abs(fft(s1,N)); % Fourier transform of s1
FFTs2=abs(fft(s2,N)); %Fourier transform of s2
FFTs=abs(fft(s,N)); % Fourier transform of s
FFTh=abs(fft(h,N)); % Fourier transform of h
FFTy=FFTs.*FFTh; % Multiplication
y=ifft(FFTy,N); % Inverse Fourier transform to get time-domain sequence

figure;
subplot(3,1,1)%% Time-domain s1
plot(n,s1)
title('Signal s1 (Frequency F1 = 100 Hz)')
grid on
subplot(3,1,2); %Time-domain s2
plot(n,s2)
title('Signal s2 (Frequency F2 = 50 Hz)')
grid on
subplot(3,1,3); %Time-domain s
plot(n,s)
title('Signal s (Frequency F1 = 100 Hz, F2 = 50 Hz)')
grid on
figure;
subplot(3,1,1); % Frequency-domain s1
stem(f,FFTs1,'-b')
title('Magnitude spectrum of 100 Hz signal')
grid on
subplot(3,1,2); % Frequency-domain s2
stem(f,FFTs2,'-g')
title('Magnitude spectrum of 50 Hz signal')
grid on
subplot(3,1,3); % Frequency-domain s
stem(f,FFTs,'-r')
title('Magnitude spectrum of s (F1 = 100 Hz, F2 = 50 Hz)')
grid on
figure; % Frequency-domain h
stem(f,FFTh,'-b')
title('Magnitude spectrum of system filter h')
grid on
figure;
stem(f,FFTy,'-b'); % Frequency-domain y
title('Magnitude spectrum of system output')
grid on
figure;% Frequency-domain s1& time-domain y
plot(n,s1,'-b',n,y,'-r')
grid on
legend('100 Hz signal','filtered signal')