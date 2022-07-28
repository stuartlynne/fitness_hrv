---
layout: post
title: New Allow or Deny Policy - Sample configurations
author: Stuart Lynne
---
## Overview

Version 0.18 of Fitness Dashboard implements a new version of the Allow or Deny policy for Ant+ devices.

The new device allow deny policy is designed to easily configure which devices you do or do not want to use in the Fitness Dashboard.

#### Allow Policy

When the policy is set to *allow*, all devices will be *ALLOWED* and *USED* in Fitness Dashboard *EXCEPT* for devices specifically
specified as *DENIED*.

*Use this when you only have a few devices that you want to prevent from being used.*

#### Deny Policy

When the policy is set to *deny*, all devices will be *DENIED* and *NOT USED* in Fitness Dashboard *EXCEPT* for devices specifically
specified as *ALLOWED*.

*Use this when you have only a few devices that you want to use.*

### Specifying Devices

There are two ways to specify a device, using the device ID, or using the Ant+ profile and device ID.

- Profile-ID - HRM-12345, MO2-34565, PWR-92342, FEC-92342
- ID - 12345, 34565, 92342

Every device has an five digit ID that is used to identify it. 

When it is broadcasting data, the data is associated with an Ant+ profile that describes the type of data:
- HRM - heart rate
- PWR - cycling power
- FEC - Fitness Trainer
- MO2 - SmO2 sensor
- TMP - temperature sensor

Some devices send data that matches multiple profiles, e.g.:
- SmO2 sensor that sends both MO2 and TMP data. 
- Smart Trainer that sends both FEC and PWR data.

In some cases you may wish to eliminate all data with a device. Sometimes only a specific type of data.
- PWR-12345 - match data from 12345 that is PWR
- 12345 - match all data from device 12345

### Test Setup

Four heart rate monitors:
1. HRM-18877
2. HRM-25953
3. HRM-28525
4. HRM-42396

Each test will show the *ant\_allow* section from the *fitness.cfg* file and the results
as shown in the *ant.log* file.

### Test 1 - Policy Allow

Allow all devices, this is the default behaviour.

```
[ant_allow]
default_policy = allow
deny = None
```

```
ALLOWED[HRM-28525] HRM-28525 not in: [ant_allow_policy] deny: None
ALLOWED[HRM-42396] HRM-42396 not in: [ant_allow_policy] deny: None
ALLOWED[HRM-25953] HRM-25953 not in: [ant_allow_policy] deny: None
ALLOWED[HRM-18877] HRM-18877 not in: [ant_allow_policy] deny: None
```

### Test 2 - Policy Allow - Deny two

Allow all devices except for two specific devices, one as ID match, one as profile ID match.

```
[ant_allow]
default_policy = allow
deny = 18877, HRM-25953
```

```
ALLOWED[HRM-28525] HRM-28525 not in: [ant_allow_policy] deny: 18877, HRM-25953
ALLOWED[HRM-42396] HRM-42396 not in: [ant_allow_policy] deny: 18877, HRM-25953
DENIED[HRM-25953] HRM-25953 is in: [ant_allow_policy] deny: 18877, HRM-25953
DENIED[HRM-18877] device number 18877 is in: [ant_allow_policy] deny: 18877, HRM-25953
```


### Test 3 - Policy Deny  

Deny all devices. This would not allow any Ant+ devices.

```
[ant_allow]
default_policy = deny
allow = None
```

```
DENIED[HRM-18877] HRM-18877 not in: [ant_allow_policy] allow: None
DENIED[HRM-28525] HRM-28525 not in: [ant_allow_policy] allow: None
DENIED[HRM-42396] HRM-42396 not in: [ant_allow_policy] allow: None
DENIED[HRM-25953] HRM-25953 not in: [ant_allow_policy] allow: None
```

### Test 4 - Policy Deny - Allow two

Deny all devices except two, one matched by ID, one matched by profile and ID.

```
[ant_allow]
default_policy = deny
allow = 18877, HRM-25953
```

```
DENIED[HRM-42396] HRM-42396 not in: [ant_allow_policy] allow: 18877, HRM-25953
ALLOWED[HRM-25953] HRM-25953 is in: [ant_allow_policy] allow: 18877, HRM-25953
ALLOWED[HRM-18877] device number 18877 is in: [ant_allow_policy] allow: 18877, HRM-25953
DENIED[HRM-28525] HRM-28525 not in: [ant_allow_policy] allow: 18877, HRM-25953
```



