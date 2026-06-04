clear
close all
clc

% Initialize serial communication
s = serialport("COM5", 115200);
readline(s); % Wait for initial signal or synchronization

% Read sensitivity factors for accelerometer and gyroscope
xSens = read(s, 1, "single");
gSens = read(s, 1, "single");

% Read 600 int16 data points from serial
data = read(s, 600, "int16");

% Extract accelerometer data
xAcc = data(1:6:end) * xSens;
yAcc = data(2:6:end) * xSens;
zAcc = data(3:6:end) * xSens;

% Extract gyroscope data
xAng = data(4:6:end) * gSens;
yAng = data(5:6:end) * gSens;
zAng = data(6:6:end) * gSens;

% Time vector for plotting 0:0.1:0.99 seconds
sampleperiod = 0.01;
nSamples = 100;
t = 0:sampleperiod:((nSamples - 1) * sampleperiod);

% Plot accelerations
plot(t, xAcc, t, yAcc, t, zAcc)
xlabel('Time [s]', 'FontSize', 18, 'FontName', 'Times')
ylabel('Accelerations [mg]', 'FontSize', 18, 'FontName', 'Times')
set(gca, 'FontSize', 16, 'FontName', 'Times')
legend('xAcc', 'yAcc', 'zAcc')

% Plot angular rates
figure
plot(t, xAng/1000, t, yAng/1000, t, zAng/1000)
xlabel('Time [s]', 'FontSize', 18, 'FontName', 'Times')
ylabel('Angular rates [dps]', 'FontSize', 18, 'FontName', 'Times')
set(gca, 'FontSize', 16, 'FontName', 'Times')
legend('xAng', 'yAng', 'zAng')

% Clear serial object
clear s