%Exercise-2

A = 5;
F = 100;
T = 1/F;
tmin = 0;
tmax = 2*T;
dt = T/100;
t = tmin:dt:tmax;

% Sampling frequency and time
Fs = 5000;
Ts = 1/Fs;
tss = 0:Ts:tmax;
n = 0:length(tss)-1;
xs = A*sin(2*pi*F*tss);

% SQNR calculation for different bit numbers
b = 1:10;                         % Number of bits
SQNR = 10*log10((3*2.^(2*b))/2);  % SQNR formula

% Creating a table in excel to show b versus SQNR 
Excel_file=[b;SQNR];
xlswrite('b_vs_SQNR.xlsx',Excel_file)

% Plot SQNR vs Number of Bits
subplot(2,1,1);
plot(b, SQNR,'-o');
title('Variation of SQNR with Number of Bits');
xlabel('Number of Bits (b)');
ylabel('SQNR (dB)');
grid on;

subplot(2,1,2);
hold on;

for b_val=1:5
    L=2^b_val-1;
    del=(2*A)/L;
    xn=xs/del;
    xn=xn-min(xn);
    xq=round(xn);
    xc=dec2bin(xq,b_val);
    xr=(bin2dec(xc)-L/2)*del;
    plot(tss, xr, 'DisplayName', sprintf('b = %d', b_val));
end

title('Reconstructed Signals for Different Bit Quantization');
xlabel('Time(seconds)');
ylabel('Amplitude');
legend('show');
grid on;

