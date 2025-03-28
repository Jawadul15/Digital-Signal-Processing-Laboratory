A=2;
f0=1000;
phi=-pi/2;
T0=1/f0;
t=0:T0/40:4*T0;
x=(4*A/pi/1)*cos(2*pi*f0*t+phi)+(4*A/pi/3)*cos(2*pi*3*f0*t+phi)+...
(4*A/pi/5)*cos(2*pi*5*f0*t+phi)+(4*A/pi/7)*cos(2*pi*7*f0*t+phi);
plot(t,x);
axis([0,0.004,-4,4])
xlabel('Time (sec)');
title('Square Wave Using Sinusoids')
grid on
