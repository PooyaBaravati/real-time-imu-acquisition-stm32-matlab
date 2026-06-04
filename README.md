# Real-Time IMU Acquisition using STM32 and MATLAB

## Project Preview

<img src="Media/imu_realtime_visualization.png" width="900">

*Real-time visualization of accelerometer and gyroscope measurements acquired from an IMU sensor through an STM32 NUCLEO platform and processed in MATLAB.*

---

## Project Overview

This project presents the development of a real-time Inertial Measurement Unit (IMU) acquisition and visualization system using STM32 NUCLEO hardware, C++, and MATLAB.

The objective was to acquire accelerometer and gyroscope measurements from an IMU sensor, transmit the data efficiently through serial communication, and process the incoming data in MATLAB for visualization and analysis.

The project evolved through several experimental stages, including sensor initialization, calibration, uncertainty analysis, binary communication, and real-time visualization of six-axis IMU measurements.

---

## Main Features

* IMU sensor integration on STM32 NUCLEO
* Accelerometer and gyroscope acquisition
* Embedded C++ development using Mbed OS
* Serial communication between STM32 and MATLAB
* Binary data transmission and decoding
* Real-time visualization of sensor measurements
* Sampling frequency analysis
* Statistical analysis and uncertainty estimation
* MATLAB-based signal processing

---

## Repository Structure

```text
.
├── codes/
│   ├── 2April/
│   ├── 5hz/
│   ├── 7April/
│   ├── 9April/
│   ├── 50ms/
│   ├── 75ms/
│   ├── 100hz/
│   └── examples/
│
├── media/
│   └── imu_realtime_visualization.png
│
└── README.md
```

---

## Development Stages

### Stage 1 – IMU Initialization

* Sensor board configuration
* IMU identification and communication verification
* Accelerometer and gyroscope activation

### Stage 2 – Data Acquisition

* Raw accelerometer measurements
* Raw gyroscope measurements
* Sensitivity calibration
* Unit conversion

### Stage 3 – Statistical Analysis

* Mean value estimation
* Type-A uncertainty calculation
* Sampling-frequency comparison
* Signal stability evaluation

### Stage 4 – Binary Communication

* Efficient transmission of sensor data
* Serialization of sensitivity parameters
* Transfer of raw IMU measurements to MATLAB

### Stage 5 – Real-Time Visualization

* Live acquisition of accelerometer data
* Live acquisition of gyroscope data
* Real-time plotting in MATLAB
* High-speed communication experiments

---

## Technologies Used

* C++
* MATLAB
* STM32 NUCLEO
* Mbed OS
* IMU Sensors
* Serial Communication

---

## Skills Demonstrated

* Embedded Systems Programming
* Sensor Integration
* Real-Time Data Acquisition
* Serial Communication
* Binary Data Processing
* MATLAB Programming
* Signal Processing
* Experimental Analysis
* Sensor Calibration

---

## Author

**Pooya Zare Baravati**

MSc Student in Autonomous Vehicle Engineering

---

## Notes

This repository documents the complete development process of an IMU acquisition and visualization pipeline, from low-level embedded communication to real-time data processing and analysis in MATLAB. The project demonstrates practical skills relevant to robotics, autonomous vehicles, sensor fusion, and embedded systems engineering.
