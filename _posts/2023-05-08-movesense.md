---
layout: post
title: Movesense - ECG and Movement data
author: Stuart Lynne
---
## Overview

*fitness_dashboard* now supports capturing both *ECG* and *Movement* data from the *Movesense* Heart Rate monitor.

With custom firmware the Movesense implements three services:

- GATT Heart Rate Measurement
- ECG Voltage
- Movement Data

All three services can be independently enabled.

## GATT Custom Firmware

Custom firmware for the Movesense is available [here](https://github.com/JonasPrimbs/movesense-ble-ecg-firmware)

Installing the firmware is straight forward using the Movesense Showcase App available for IOS and Android.

Reverting to the standard firmware is also easy. It takes about 2-3 minutes to change firmware once you have the app installed and the firmware downloaded.

Complete instructions are in the README in the git archive.


## ECG

ECG data can be sampled at an of the following measurement intervals
- 500 Hz
- 250 Hz
- 125 Hz
- 100 Hz

*fitness_dashboard* saves the data into the workout *FIT* file and into an activity CSV file.

```
time,ecg_mv,ecg_ms,ecg_hz
12:40:47,-200,203079,8
12:40:47,-197,,
12:40:47,-197,,
12:40:47,-193,,
12:40:47,-168,,
12:40:47,-178,,
12:40:47,-190,,
12:40:47,-195,,
12:40:47,-194,,
12:40:47,-193,,
12:40:47,-194,,
12:40:47,-197,,
12:40:47,-200,,
12:40:47,-205,,
12:40:47,-212,,
12:40:47,-217,,
12:40:48,-219,203207,
12:40:48,-205,,
12:40:48,-195,,
```

## Movement

Movement data includes acceleration, gyroscope and magnetometer data.

These measurement intervals can be selected:

- 208 Hz
- 104 Hz
- 52 Hz
- 26 Hz

The data is stored in an activity file.

```
```


