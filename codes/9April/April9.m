clear
close all
clc

%% 1. Setup Serial Communication
% Replace "COM3" with your actual COM port
s = serialport("COM5", 921600);
%configureTerminator(s, "");  % No line terminator for binary comm

%% 2. Define Parameters
sampleperiod = int16(20);   % Sample period in milliseconds
nSamples = int16(1000);     % Number of samples to read

% Send sample period and number of samples to the microcontroller
write(s, typecast(sampleperiod, 'uint8'), "uint8");
write(s, typecast(nSamples, 'uint8'), "uint8");

% Send the start character 's' to begin streaming
write(s, 's', "char");

%% 3. Wait for Sensor ID Confirmation (optional)
% Reads a line like: "iNemo replied id: 0X6A"
idLine = readline(s);
disp(idLine)

%% 4. Receive Sensitivity Factors (4 bytes each for float)
% Receive accelerometer sensitivity
xBytes = read(s, 4, "uint8");
xSens = typecast(uint8(xBytes), "single");

% Receive gyroscope sensitivity
gBytes = read(s, 4, "uint8");
gSens = typecast(uint8(gBytes), "single");

fprintf("Accel Sensitivity: %.3f   |   Gyro Sensitivity: %.3f\n", xSens, gSens);

%% 5. Initialize Data Buffers
xAcc = nan(1, nSamples);
yAcc = nan(1, nSamples);
zAcc = nan(1, nSamples);
xAng = nan(1, nSamples);
yAng = nan(1, nSamples);
zAng = nan(1, nSamples);
t = (0:(nSamples-1)) * double(sampleperiod);

%% 6. Setup Live Plots
figure("Name", "IMU Real-Time Data", "Color", "w");

subplot(2,3,1); xA = plot(t, xAcc); title("X Acceleration");
subplot(2,3,2); yA = plot(t, yAcc); title("Y Acceleration");
subplot(2,3,3); zA = plot(t, zAcc); title("Z Acceleration");
subplot(2,3,4); xW = plot(t, xAng); title("X Angular Velocity");
subplot(2,3,5); yW = plot(t, yAng); title("Y Angular Velocity");
subplot(2,3,6); zW = plot(t, zAng); title("Z Angular Velocity");

%% 7. Start Reading and Plotting Data
disp("Receiving and plotting data...")
tic
for kk = 1:nSamples
    % Read 6 int16 values = 12 bytes = 6 elements
    data = read(s, 6, "int16");

    % Process acceleration (ADC code × sensitivity)
    xAcc(kk) = double(data(1)) * xSens;
    yAcc(kk) = double(data(2)) * xSens;
    zAcc(kk) = double(data(3)) * xSens;

    % Process gyro (ADC code × sensitivity ÷ 1000 to convert to dps)
    xAng(kk) = double(data(4)) * gSens / 1000;
    yAng(kk) = double(data(5)) * gSens / 1000;
    zAng(kk) = double(data(6)) * gSens / 1000;

    % Update plots live
    xA.YData = xAcc;
    yA.YData = yAcc;
    zA.YData = zAcc;
    xW.YData = xAng;
    yW.YData = yAng;
    zW.YData = zAng;
end
toc

%% 8. Cleanup
clear s
disp("Done.")