#!/bin/bash

TEMP="/sys/devices/virtual/thermal/thermal_zone0/temp"
MODE="/sys/devices/platform/odroidu2-fan/fan_mode"
PWM="/sys/devices/platform/odroidu2-fan/pwm_duty"
# Fan speeds
FANSPEED_3=255
FANSPEED_2=170
FANSPEED_1=100
FANSPEED_0=54
# Temerature threshold in Celsius
TEMPLEVEL_3=42
TEMPLEVEL_2=38
TEMPLEVEL_1=35
# Update delay duration (Second)
UPDATEDL=3

echo manual > $MODE
ecjp $FANSPEED_3 > $PWM
while true; do
	sleep $UPDATEDL
	if [ `cat $TEMP` -ge "$TEMPLEVEL_3"000 ]; then
		echo $FANSPEED_3 > $PWM
	elif [ `cat $TEMP` -ge "$TEMPLEVEL_2"000 ]; then
		echo $FANSPEED_2 > $PWM
	elif [ `cat $TEMP` -ge "$TEMPLEVEL_1"000 ]; then
		echo $FANSPEED_1 > $PWM
	else
		echo $FANSPEED_0 > $PWM
	fi
done
