#!/bin/bash

TEMP="/sys/devices/virtual/thermal/thermal_zone0/temp"
MODE="/sys/devices/platform/odroidu2-fan/fan_mode"
PWM="/sys/devices/platform/odroidu2-fan/pwm_duty"

if [ -z $1 ] ; then
	echo "Parameter: PWM speed (0~255)"
	exit 1
elif [ $1 -gt 255 ] || [ $1 -lt 0 ] ; then
	echo "PWM speed invalid (0~255)"
	exit 1
fi
echo manual > $MODE
echo $1 > $PWM
