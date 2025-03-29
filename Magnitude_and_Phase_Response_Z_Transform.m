% Define the coefficients for the system
a = [1 2 1];    % Coefficients of x
b = [1 -1.2 0.75]; % Coefficients of y

% Sampling rate
Fs = 10 * 10^3; % Sampling frequency in Hz
N = 512;        % Number of DFT points (power of 2 for better resolution)

% Frequency response of the system
[Hz, f] = freqz(a, b, N, Fs);

% Magnitude and phase response
Mz = abs(Hz);   % Magnitude response
Pz = angle(Hz); % Phase response

% Plot magnitude and phase response
figure;

% Subplot for magnitude response
subplot(2, 1, 1);
plot(f, Mz, 'b', 'LineWidth', 1.5);
grid on;
title('Magnitude Response of the System');
xlabel('Frequency (Hz)');
ylabel('|H(f)|');
xlim([0 Fs/2]); % Restrict to 0 to Fs/2 for visualization

% Subplot for phase response
subplot(2, 1, 2);
plot(f, Pz, 'r', 'LineWidth', 1.5);
grid on;
title('Phase Response of the System');
xlabel('Frequency (Hz)');
ylabel('\angle H(f)');
xlim([0 Fs/2]); % Restrict to 0 to Fs/2 for visualization

% Finding the frequency of maximum magnitude
[max_magnitude, max_index] = max(Mz);
freq_max_magnitude = f(max_index);

% Display frequency of maximum magnitude
disp(['Frequency of maximum magnitude: ', num2str(freq_max_magnitude), ' Hz']);

% Find 3dB bandwidth
half_power_level = max_magnitude / sqrt(2); % 3dB point corresponds to 1/sqrt(2)
bandwidth_indices = find(Mz >= half_power_level); % Indices where magnitude >= half-power
f_low = f(bandwidth_indices(1)); % Lower frequency at 3dB point
f_high = f(bandwidth_indices(end)); % Upper frequency at 3dB point
bandwidth = f_high - f_low;

% Display 3dB bandwidth
disp(['3dB Bandwidth of the system: ', num2str(bandwidth), ' Hz']);

% Determine filter type
if freq_max_magnitude < Fs/4
    filter_type = 'Low-pass';
elseif freq_max_magnitude > Fs/4 && freq_max_magnitude < 3*Fs/4
    filter_type = 'Band-pass';
else
    filter_type = 'High-pass';
end

disp(['The system acts as a ', filter_type, ' filter.']);
	
