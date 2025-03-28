m=0:1:15;
xn=(0.8).^m;
n=0:1:10;
hn=(1.4).^n;
yc=conv(xn,hn);
Lx=length(xn);
Lh=length(hn);
L=Lx+Lh-1;
k=0:1:L-1;
figure;

subplot(1,3,1);
stem(m,xn,'filled');
xlabel('Index,m');
ylabel('Input Sequence, x(n)');
title('Input Sequence x[n]');

subplot(1,3,2);
stem(n,hn,'filled');
xlabel('Index, n');
ylabel('Impulse Response, h[n]');
title('Impulse Response h[n]');

subplot(1,3,3);
stem(k,yc,'filled');
xlabel('Index,k');
ylabel('Output Sequence, yc');
title('Output Sequence yc');



X=fft(xn,L);
H=fft(hn,L);
mX=abs(X);
pX=angle(X);
mH=abs(H);
pH=angle(H);
figure;

subplot(2,2,1);
stem(k,mX,'filled');
xlabel('Index,k');
ylabel('Magnitude,\midX(k)\mid');
title('Magnitude of X[k]');

subplot(2,2,2);
stem(k,pX,'filled');
xlabel('index,k');
ylabel('Phase,\angleX(k)');
title('Phase of H[k]');

subplot(2,2,3);
stem(k,mH,'filled');
xlabel('Index,k');
ylabel('Magnitude,|H(k)|');
title('Magnitude of H[k]');

subplot(2,2,4);
stem(k,pH,'filled');
xlabel('Index,k');
ylabel('Phase,\angleH(k)');
title('Phase of H[k]');



Y=X.*H;
yf=ifft(Y,L);
figure;

subplot(1,2,1);
stem(k,yc,'filled');
xlabel('Index,k');
ylabel('Response,yc');
title('Response from Convolution (Time Domain)');

subplot(1,2,2);
stem(k,yc,'filled');
xlabel('Index,k');
ylabel('Response,yf');
title('Response from Fourier Transform (Frequency Domain)');
difference=norm(yc-real(yf));
disp(['Difference between yc and yf: ',num2str(difference)]);