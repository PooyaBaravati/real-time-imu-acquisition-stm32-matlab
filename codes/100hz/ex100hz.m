clear; clc; close all;

%% Serial setup
s = serialport("COM5", 115200);  % Change COM port if needed
nSamples = 100;

%% Read sensitivity (4 bytes = 1 float)
rawSens = read(s, 4, "uint8");
sensitivity = typecast(uint8(rawSens), 'single');
sensitivity = sensitivity / 1000;  % Convert from mg to g

fprintf("Received sensitivity: %.6f g/LSB\n", sensitivity);

%% Read 100 int16 raw Z-axis values
rawZ = read(s, nSamples, "int16");

%% Convert to acceleration in g
zAcc = double(rawZ) * sensitivity;

%% Time vector
t = (0:nSamples-1) * 0.01;

%% Plot
plot(t, zAcc, 'b.-');
xlabel("Time (s)");
ylabel("Z Acceleration (g)");
title("Z-Axis Acceleration");

%% Stats
fprintf("Mean: %.5f g\n", mean(zAcc));
fprintf("Std Dev: %.5f g\n", std(zAcc));

%% Optional: Save
save('zAccData_in_g.mat', 'zAcc');
