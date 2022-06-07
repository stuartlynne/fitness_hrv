---
layout: post
title: Windows USB Support for Ant+ - libusb0-win32
author: Stuart Lynne
---
## Overview

*Fitness\_Dashboard* uses uses the *libusb0-win32* library 
to communicate with the *libusb0.sys* driver that provides the actual communcation to 
the *Ant+* device.

N.B. There are various other solutions that are available, but they are not
guaranteed to work and in some cases *DO NOT* work properly.

- libusb-1.0
- libusbK
- WinUSB
- USB Serial (CDC)


In particular the *libusb-1.0* library is a newer version of *libusb0-win32* but
it lacks some features that are supported in the older driver.

Specifically in systems that have multiple *Ant+* devices that are shared between
multiple programs, e.g. Zwift and Trainer Dashboard, *libusb-1.0* fails to prevent
the different programs from using the same device.

*Failure to use the correct driver may cause any programs that use Ant+ devices to fail
to operate correctly.*

## Checking Ant+ Driver Installation

Various programs such as *Zwift* may have already installed the correct *libusb0-win32*
libaries and drivers in your system.

You can check what is being used with the Windows *Device Manager*.

Look for the *libusb-win32* devices, you should see *ANT USBStick* or similar. Click
on that, then select the *Driver Tab* and then *Driver Details*.

| | |
| --- | --- |
|![Device manager](/img/device-manager-ant-usbstick2.png)||


## Changing Ant+ Drivers using Zadig

If you do not have *libusb0-win32* installed you can correct it using the *Zadig* program.

Download: [Zadig homepage](https://zadig.akeo.ie)

Download, unzip and run the zadig exe.

Once you have run it, click on *Options* and click on the *List All Devices* menu item.

The find your Ant+ devices (you will need to do this for each one), select each, select
the *lib-win32* driver and click on *Install Driver*.

| | |
| --- | --- |
|![Zadig](/img/zadig-libusb0.png)||



## Other Windows Issues

Generally if you are having issues with programs not working, the first thing to do is
uninstall the device, with drivers, using the Device Manager.

Then unplug, replug the devices and use Zadig to install the drivers again.

## Zwift

Generally *Zwift* works well and cooperates with other programs.

If there are any issues try running Zwift first, and Fitness\_Dashboard after 
Zwift has set up its devices.


## Trouble Shooting

- Antenna for builtin
- Scanning - nothing
- Scanning, connecting forever
- Scanning, Connected, PPI receiving

