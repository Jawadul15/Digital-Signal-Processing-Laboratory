% Define the coefficients for the system
a = [1 2 1];    % Coefficients of x
b = [1 -1.2 0.75]; % Coefficients of y

% Sampling rate
Fs = 10 * 10^3; % Sampling frequency in Hz
T = 1 / Fs;     % Sampling period

% Transfer function of the system
H = tf(a, b, T, 'variable', 'z^-1');

% Display the transfer function
disp('Transfer Function H(z):');
disp(H);

% Determination of poles and zeros
[zero, pole] = tf2zp(a, b);

% Display the zeros and poles
disp('Zeros of the system:');
disp(zero);
disp('Poles of the system:');
disp(pole);

% Plot the pole-zero diagram
figure;
zplane(a, b);
grid on;
title('Pole-Zero Diagram of the System');
xlabel('Real Part');
ylabel('Imaginary Part');