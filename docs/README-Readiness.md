# AIEndurance HRV Readiness
## Overview 

*aiendurance* has defined and promoted the concept of *Readiness* and *Durability* based on *DFA A1*.

HRV *Readiness* is calculated during the first thirty minutes of a workout (during the warm up period) and compares
your data against a baseline of data from previous workouts. 

From *AIEndurance*:
```
If you put out less power/pace for the saem a1 on a given day, you are not performing 
well compared to your current baseline.

Conversely, if your power/pace for the same a1 is higher than your current baseline, 
this is an indication that you're performing well and you might be particularly ready 
to train or race.
```

HRV *Durability* is a comparison between the first and second half of a workout and quantifies durability (effectively endurance).
From *AIEndurance*:
```
If you put out significantly less power/pace for the same a1 during the second half of 
your workout compared to the first half, this indicates a lack of durability for a given 
workout type and/or length.

Conversely, if your pace/power for a given a1 is constant throughout a workout, this 
indicates durability of the athlete.
```

## Alternatives

Other approaches to HRV Readiness using *rMSSD* and *sDNN* are available using apps such as *HRVTraining*, *EMFIT*, *Kubios*, *Oura* etc.
These typically suggest a morning measurement on waking to allow making a decision about training. These can provide data to make a
decision about training before starting, but require the additional steps to take the measurement every day so that baseline data is 
available.

This approach to *readiness* allows an athlete to use the warm up period of his workout to make decisions about how to continue the workout. 
A high readiness score may allow for a harder then planned workout. A low score can suggest scaling back the planned workout. 

The advantage of this approach is that the if the fitness app is being used the readiness score is automatically calculated. There are no
additional steps required. 

The trade off is being able to make an earlier decision based on a separate measurement or getting information on fitness
from data collected automatically during the warmup.


## References
- [New readiness to train and durability HRV metrics](https://aiendurance.com/blog/readiness-to-train-and-durability-hrv-metrics)
- [To train hard or not, that's the question ](http://www.muscleoxygentraining.com/2021/08/to-train-hard-or-not-thats-question.html)
- [Fractal correlation properties of heart rate variability as a biomarker of endurance exercise fatigue in ultramarathon runners]
(https://physoc.onlinelibrary.wiley.com/doi/full/10.14814/phy2.14956)


## a1 and P data

*a1* is derived using the *DFA Alpha1* algorithm from the recorded *RR* data from a heart rate monitor.

*P* is the average derived from the *power* data recorded from a power meter or fitness trainer.

*a1* and *P* are calculated every two seconds starting at two minutes into the workout and saved.

Starting at two minutes into the workout, every two seconds:
- *a1* data for a specific point in time is derived from the previous two minutes of HRV RR data 
- *P* data is the average of the power recorded for the previous two minutes of power data

N.b.  *a1* is displayed and graphed as a separate statistic in *fitness_dashboard*.


## Pa Function Definition

The *Pa function* is used to derive the *power* necessary to perform at a fixed *a1*. This can derived from a specified range of *a1* and *P* data. 

*Pa* is based on the dot product of the specified range of the *a1* and *P* lists.

```
    def Pa(Ns, Ne):
        a1 = a1_data_for_workout[Ne:Ns]
        P = average_power_data_for_a1_periods[Ne:Ns]
        return (1 / len(a1)) * sum([x*y for xy in zip(a1,P)])
```

The *Pa* function is used to calculate other statistics, typically *Ra* and *Da*.

## Ra readiness to train / recovery

*Ra* is a measure of the fitness state as measured during the first half hour of a workout. It is derived from *a1* and *P* using the *Pa function*. 

*Ra* is based on *Pa(5\*60, 30\*60), i.e. the power required to train for the initial portion of the workout, discarding the first five minutes. 

The *Ra* data calculated for every workout and saved. 

```
    # Ra = 100 * ((iPa - mean(iPa)) /mean(iPa))
    def Ra():
        RaData = read_ra_data()
        iPa = Pa(5*60, 30*60):
        ra = 100 * ((iPa - mean(RaData[-30])) / mean(RaData[-30]))
        RaData.append(ra)
        write_ra_data(RaData)
        return ra
```

*Ra* will be calculated as iPa is being calculated and displayed in the HRM stat plot.

### Implementation Note

*Ra* will be calculated and saved for every workout, but the mean value needs to be calculated only using the first valid Ra
for each calendar day. 

Specifically: 
- short aborted workouts should be ignored at the beginning of a workout session.
- additional workouts after the first valid warm up (at least 30 minutes?) are ignored


## Da durability / drift

The *Da* statistic is calculated for every workout longer than thirty minutes. It is intended to quantify the athletes ability to
perform the workout.

The *Da* variable is calculated using the *Pa* data for the first half and the second half of the workout. 

If the athlete puts out:
- less power for the same *a1* in the second half of the workout this shows a lack of durability. 
- constant power for a give *a1* indicates durability. 

Using *Pa*, durability is defined as:

```
    # Da = 100 * (Pa(first half) - Pa(second half)) / Pa (first half))
    def Da(workout_length):
        pa_first_half = Pa(1, workout_length/2)
        pa_second_half = Pa(workout_length/2, 1)
        return 100 * (pa_first_half - pa_second_half) / pa_first_half
```

The more negative Da for an activity, the less durability for that particular workout type and duration.

*Da* will be calculated starting at thirty minutes and displayed in the HRM stat plot. 

### Typical values for durability

- Durability is most often negative. 
- -5% to -15% to be typical. 




