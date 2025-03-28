clc; close all; clear;

% Parameters for the rectangular pulse
duty = 50;       % On-OFF time ratio of square wave
f = 10e9;        % Frequency of the square wave
ti = 1 / f;      % Time period
s = ti / 100;    % Sampling period
t1 = 0:s:10*ti;  % Total time
x1 = square(2 * pi * f * t1, duty); % Rectangular pulse
n1 = t1 / s;     % Sample indices

% Delay the signal by 20 * ti
tdelay = 20 * ti;    % Time delay
n0 = tdelay / s;     % Shifting in terms of samples
[x2, n2] = sigshift(x1, n1, n0); % Delayed signal
t2 = n2 * s;         % Time range of delayed signal

% Align y1 and y2 with respect to the origin
min_n = min(min(n1), min(n2));
max_n = max(max(n1), max(n2));
n = min_n:max_n; % Aligned sample indices
t = n * s;       % Aligned time vector

y1 = zeros(1, length(n)); % Initialize aligned signals
y2 = zeros(1, length(n));

% Assign values to the aligned signals
y1(find((n >= min(n1)) & (n <= max(n1)) == 1)) = x1;
y2(find((n >= min(n2)) & (n <= max(n2)) == 1)) = x2;

% Add AWGN to y2
y2n = awgn(y2, 5, 'measured'); % Signal with noise

% Cross-correlation function
[CCF, lagx] = xcorr(y2n, y1, 'coeff'); % Cross-correlation
lagx_s = lagx * s;                     % Lag in seconds

% Plotting results
figure;

% Plot clean signal y1
subplot(3, 1, 1);
plot(t, y1, '-b');
title('Clean Signal (y1)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot noisy signal y2n
subplot(3, 1, 2);
plot(t, y2n, '-r');
title('Noisy Signal (y2n)');
xlabel('Time (s)');
ylabel('Amplitude');
grid on;

% Plot cross-correlation function
subplot(3, 1, 3);
plot(lagx_s, CCF, '-g');
title('Cross-correlation (CCF)');
xlabel('Lag (s)');
ylabel('CCF');
grid on;

% Supporting function for signal shift
function [y, n] = sigshift(x, m, n0)
    n = m + n0; % Shifted indices
    y = x;      % Shifted signal
end
