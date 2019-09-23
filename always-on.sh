#!/bin/bash


TEMP="/sys/devices/virtual/thermal/thermal_zone0/temp"
MODE="/sys/devices/platform/odroidu2-fan/fan_mode"
PWM="/sys/bus/platform/devices/odroidxu-fan/pwm_duty"
# Fan speed
FANFAST=96
FANSLOW=255
# Temerature threshold (30000=30℃)
TEMPTHLD=30000
# Update delay duration (Second)
UPDATEDL=2

echo manual > $MODE
while true; do
    if [ `cat $TEMP` -gt $TEMPTHLD ]; then
        echo $FANFAST > $PWM
    else
        echo $FANSLOW > $PWM
    fi
    sleep $UPDATEDL
done