clc; close all; clear all;
A=10; f = 500; theta = pi/4; % Define the values the three parameters
T = 1/f;
t = 0:T/40:4*T; % Define the sampling points
x = A*cos(2*pi*f*t+theta); % Generate the cosine function
plot(t,x) % Plot the cosine function
xlabel('Time (sec)'); % Add a label to x axis
ylabel('Amplitude (volt)') % Add a label to y axis, Let the unit is in volt
grid on % Show the cosine function on a grid


function z=coswave(A,F,Th)
T=1/F;
t=0:T/40:3*T;
x=A*sin(2*pi*F*t+Th);
plot(t,x);
title('sinusoids');
xlabel('Time (sec)');
ylabel ('Amplitude, A');
grid on;
end

