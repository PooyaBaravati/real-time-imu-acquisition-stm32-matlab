clear
close all
clc

s=serialport("COM5",115200);

readline(s)

xSens = read(s,1,"single")
gSens = read(s,1,"single")

clear s