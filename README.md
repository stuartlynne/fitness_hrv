# Fitness HRV

The *Fitness HRV* family of apps are provide a framework for logging and analysis of training data in real-time.

Currently there are two applications available in *Alpha* release:

- Fitness\_Dashboard
- Fitness\_ECG

Currently *Fitness* applications are only available for *Windows 10 and 11*.

*MacOS* availibilty is pending.

## Example
![Sample ECG](./icons/graph2.svg) Fitness Dashboard 
![Live](./images/test.gif)

*Fitness\_Dashboard* captures *Ant+* and *BLE* dat from power meters, heart rate monitors, fitness trainers and various other devices. 

The data is displayed in two ways. First is a set of graphs showing various statistics. Second a large display of the current values for the 
statistics from each device being monitored. The intent is to provide the equivalent of of a cycling computer with a much larger and easier
to read interface suitable for using when training indoors.

Currently supported:

- Ant+ Device Profiles
    - Heart Rate 
    - Bicycle Power
    - Fitness Equipment (FE-C)
    - Muscle Oxygen
    - Bicycle Speed and Cadence

Example:
![Sample Dashboard](./images/dashboard1.png)

### Download
[Fitness\_Dashboard v0.13](https://github.com/stuartlynne/fitness_hrv/releases/download/v0.13-alpha/Fitness_Dashboard_0.13_setup.exe)

## ![Sample ECG](./icons/ecg-lines.svg) Fitness ECG

*Fitness\_ECG* captures heart rate and *ECG* data from a *Polar H10* heart rate monitor. This is displayed as an *ECG* trace and 
heart rate graph over time.

The application supports:
- paging forward and back through the ECG trace
- sizing the ECG trace 
- printing the currently displayed ECG trace to a PNG or PDF file
- recording the ECG and heart rate data to *CSV* files.

Example:
![Sample ECG](./images/ecg1.png)

### Download
[Fitness\_ECG v0.13](https://github.com/stuartlynne/fitness_hrv/releases/download/v0.13-alpha/Fitness_ECG_0.13_setup.exe)

## Ant+ and BLE
There is a wealth of data available from our training devices, power meters, heart rate monitors, fitness trainers, etc.

These provide device specific data via *Ant+* and *BLE* using various standards. Typically *Ant+* devices broadcast data
and it is easy to capture the data without interference with other programs that are also using them. *BLE* devices are
more limited in the number of connections they support and will usually require pairing to work correctly.


## Posts
<ul>
  {% for post in site.posts %}
    <li> <a href="{{ post.url }}">{{ post.date }} {{ post.title }}</a> </li>
  {% endfor %}
</ul>





