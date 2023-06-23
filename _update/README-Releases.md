# Fitness Releases
    
## Overview
    
Release tags:

- vN.NN-Type

Types:

- Alpha 
- Beta
- Production


## Procedure

1. In github, fitness\_hrv, create new release.
2. Add Fitness\_Dashboard\_N.NN\_setup.exe to binaries and publish
3. In fitness\_hrv/update, type make
4. In github, edit release and add latest-dashboard.json to previous release(s), publish
5. cp downloads.html latest.html ../_includes
6. cp DOWNLOADS.md ../
7. In github, fitness\_hrv, add latest-dashboard.json to release.


## Typical latest.json
```
{
    "Fitness_\Dashboard_0.15_setup.exe": "https://github.com/stuartlynne/fitness_hrv/releases/download//v0.15-alpha/Fitness_Dashboard_0.15_setup.exe",
    "Fitness_ECG_0.15_setup.exe": "https://github.com/stuartlynne/fitness_hrv/releases/download//v0.15-alpha/Fitness_ECG_0.15_setup.exe",
    "date": "Mon 13 Jun 2022 12:23:42 PM PDT"
} 
```


## Latest Release

Special set of assets to show latest.json files for each type of release:

- Name: latest-[ecg,dashboard]
- Tag: v0.0
- Assets:
    - latest-download-alpha.json
    - latest-download-beta.json
    - latest.download-json
    - latest-ecg-alpha.json
    - latest-ecg-beta.json
    - latest.ecg-json
    
These will contain the latest files available for each type of release.

Making these available as a release asset will allow tracking of the downloads which will show
usage patterns for each release.
