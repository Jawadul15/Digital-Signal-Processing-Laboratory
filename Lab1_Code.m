b=3;
A=5;
F=100;
T=1/F;
tmin=0;
tmax=2*T;
dt=T/100;
t=tmin:dt:tmax;
xt=A*sin(2*pi*F*t);
subplot(4,1,1)
plot(t,xt,'-k');
title('Analog Signal');
xlabel('t');
ylabel('x(t)');
grid on;

Fs=5000;
Ts=1/Fs;
ts=tmin:Ts:tmax;
n=ts*Fs;
f=F/Fs;
xs=A*sin(2*pi*f*n);
subplot(4,1,2)
plot(n,xs,'bd');
title('Sampled Signal');
xlabel('n');
ylabel('xs(n)');
grid on;

L=2^b-1;
del=2*A/L;
xn=xs/del;
xn=xn-min(xn);
xq=round(xn-min(xn));
en=xq-xn;
subplot(4,1,3)
plot(n,xn,'mo',n,xq,'bd',n,en,'b*');
title('Sampled Signal, Quantized signal & Quantization Error');
xlabel('n');
ylabel('x(n) or xq(n) or e(n)');
grid on;
legend('Sampled Signal','Quantized Signal','Quantization Error');

Px=A^2/2;
Pe=A^2/(3*2^(2*b));
SQNR=10*log10(Px/Pe);
xc=dec2bin(xq,b)

xr=(bin2dec(xc)-L/2)*del;
subplot(4,1,4)
plot(t,xt,'-k',ts,xr,'-b');
title('Original Signal and Reconstructed Signal');
xlabel('t');
ylabel('x(t) or xr(t)');
grid on;
legend('Original Signal','Reconstructed Signal');