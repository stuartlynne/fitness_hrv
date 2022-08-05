# Fitness HVR Release Notes

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
