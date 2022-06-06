---
layout: post
title: Pedal Dynamics
author: Stuart Lynne
published: false
---
## Overview 



## RacerMate SpinScan

- measures torque at 24 points in a single pedal stroke, this is then plotted as a peanut or graph.
- The CT's spinscan also only knows the precise crank position once per revolution - it requires a cadence sensor to operate, and it also assumes the placement of that sensor is correct in guesstimating how much power to allocate to each part of the pedal stroke.

- at 60 rpm, 24 / second, 

## Golden Cheetah

- implements a Polar Plot for spin scan analysis


## Ant+ pedal dynamics

Right / Left pedal force pages, at least once per second for a 4hz transmitter?

Each page:

    - Start Angle - The angle at which the positive torque begins
    - End Angle - The angle at which the positive torque ends
    - Start Peak Angle - The angle at which, between it and the end peak angle the peak torque is achieved
    - End Peak Angle - The angle at which, between it and the start peak angle the peak torque is achieved
    - Torque - the average torque during this interval

## Computrainer Pulse Power

[wattage post](https://wattage.topica.narkive.com/9Wd7nfx5/pulsepower)
The Computrainer has a PulsePower calculated measure defined as
(watt-seconds[in ft-lbs/beat]/heartbeat)/(bike+body weight)*1000,
according to RacerMate.

```
Some - the cardiovascular Fick equation is:

VO2 = heart rate x stroke volume x arteriovenous O2 difference

If you divide both sides by heart rate, what you get is known as O2
pulse:

O2 pulse = VO2/heart rate = stroke volume x arteriovenous O2 difference

If you assume that VO2 is directly proportional to power, then you can
substitute power into the above equation:

O2 pulse = power/heart rate = stroke volume x arteriovenous O2
difference.

Thus, changes in power:heart rate provide an indirect indicator of
changes in cardiovascular fitness. In interpreting the data, however,
you have to keep in mind not only variations in heart rate, but also the
fact that power:heart rate automatically increases with increasing
exercise intensity (due to non-linearities in physiological responses as
well as non-zero intercepts). IOW, it's only valid to compare
power:heart rate when power is comparable.
Coggan
```

```
Average Pulse Power = ([(Avg Power)/(Avg HR)]/weight)*1000
Power: in watts
HR: in BPM
weight: in pounds
```



