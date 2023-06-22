# Fitness Dashboard Release Notes

## v0.29 roadmap

### fitness\_dashboard
- control panel to start/stop, laps, FIT file 
- reading FIT file for analysis
- add ECG graph 
- power sensor comparison panel
- pan and zoom for graph panel
- save graphs to PDF
- MO2 analysis panel

## v0.28 
- fix shutil missing error which prevented use in Windows 11 Home

## v0.25
- support for Movesense (requires custom firmware)
- make ECG and ACC separate virtual services for Polar H10 and Movesense
- readiness history now derived from previous 30 days of fit files
- accelerometer data saved to activity csv file
- faster BLE scanner to find devices
- improved BLE support
- improved BLE and ANT control panels

Custom firmware for the Movesense is available [here](https://github.com/JonasPrimbs/movesense-ble-ecg-firmware)


## v0.22 alpha

### fitness\_dashboard
- initial support for BLE, currently Moxy, Polar H10, Garmin Dual, Movesense
- initial support to capture speed, distance, etc from Sauce4Zwift
- initial support to generate FIT files
- support for Alpha1, multiple heart rate and power sensors, ecg data, in FIT files
- python command line tool to extract FIT data [fitextract sample scripts](https://github.com/stuartlynne/fitextract)

## v0.21 alpha

### fitness\_dashboard
- support Ant+ CORE Temp Device Profile, tested against Core Body Temperature Sensor
- add Ant+ and BLE log tabs
- add Ant+ device configuration tab panel, enable/disable devices, stats and plots

## v0.20 alpha

### fitness\_dashboard
- DFA Window corrected to use end point time and use points [t-120 through t], this should match Kubios
- Ant Power checks for spikes in instantaneous power
- Ant Power ensures that instantaneous power is valid (some power meters continue to send ipower when coasting)
- Ant Heart Rate fix for event beat count rollover

### fitness\_ecg
- ECG conversion of RR values from 1024 to 1000


## v0.17 alpha

N.B. Be sure to update fitness.cfg with your name and ftp.

### fitness\_dashboard
- Ant recording - capture Ant data to file
- athlete - add name and ftp to fitness.cfg
- check online for update 
- implemented AIEndurance Readiness and Durability
- implemented TSS, IF and NP
- FE-C - correctly ignore incline when set to invalid value
- MO2 - support for Ant+ Muscle Oxygen profile, tested with MOXY
- dynamic chart selection depending on devices available

## v0.16 alpha
### fitness\_dashboard
- add optional update check
- correct name in setup
- save NN data 

### fitness\_ecg
- add optional update check

## v0.15 alpha
### fitness\_ecg
- fix pdf file generation
- notification notice for png and pdf file generation with auto-close

## v0.14 alpha
### fitness\_ecg
- fix first line display bug 
- use overwrite mode for single line

## v0.13 alpha
- Initial Alpha release of fitness\_ecg and fitness\_dashboard
