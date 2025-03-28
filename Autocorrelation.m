% Parameters for the rectangular pulse
duty = 50;  % On-OFF time ratio of square wave
f = 4e9;    % Frequency of the rectangular pulse
ti = 1 / f; % Time period
s = ti / 100; % Sampling period
t = 0:s:8*ti; % Time range

% Rectangular pulse (square wave)
x = square(2*pi*f*t, duty);

% Random noise with size equal to x
a = 1; b = -1; % Noise range [-1, 1]
n = (b-a) * rand(size(x)) + a;

% Noisy signal
xn = x + n;

% Autocorrelation functions
[ACFx, lagx] = xcorr(x, x, 'coeff');
[ACFn, lagn] = xcorr(n, n, 'coeff');
[ACFxn, lagxn] = xcorr(xn, xn, 'coeff');

% Convert lag to time scale
lagx_s = lagx * s;
lagn_s = lagn * s;
lagxn_s = lagxn * s;

% Plotting signals
figure;

subplot(1,3,1)
plot(t, x, '-b')
title('Clean Square Wave (x)')
xlabel('Time (s)')
ylabel('Amplitude')
grid on

subplot(1,3,2)
plot(t, n, '-r')
title('Noise (n)')
xlabel('Time (s)')
ylabel('Amplitude')
grid on

subplot(1,3,3)
plot(t, xn, '-g')
title('Noisy Signal (xn)')
xlabel('Time (s)')
ylabel('Amplitude')
grid on

% Plotting autocorrelation functions
figure;

subplot(1,3,1)
plot(lagx_s, ACFx, '-b')
title('Autocorrelation of x')
xlabel('Lag (s)')
ylabel('ACF_x')
ylim([-1 1])
grid on

subplot(1,3,2)
plot(lagn_s, ACFn, '-r')
title('Autocorrelation of n')
xlabel('Lag (s)')
ylabel('ACF_n')
ylim([-1 1])
grid on

subplot(1,3,3)
plot(lagxn_s, ACFxn, '-g')
title('Autocorrelation of xn')
xlabel('Lag (s)')
ylabel('ACF_{xn}')
ylim([-1 1])
grid on

% Combined plot for better visualization
figure;
plot(lagx_s, ACFx, '-b', 'DisplayName', 'ACF of x')
hold on
plot(lagn_s, ACFn, '-r', 'DisplayName', 'ACF of n')
plot(lagxn_s, ACFxn, '-g', 'DisplayName', 'ACF of xn')
title('Autocorrelation Functions')
xlabel('Lag (s)')
ylabel('ACF')
ylim([-1 1])
legend
grid on
