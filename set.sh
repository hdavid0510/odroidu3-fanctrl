#!/bin/bash

TEMP="/sys/devices/virtual/thermal/thermal_zone0/temp"

# For old ODROID U3 system images
#MODE="/sys/devices/platform/odroidu2-fan/fan_mode"
#PWM="/sys/devices/platform/odroidu2-fan/pwm_duty"

#For recent/community built ODROID U3 system images (Ubuntu 18.04~)
MODE="/sys/devices/platform/pwm-fan/fan_mode"
PWM="/sys/devices/platform/pwm-fan/hwmon/hwmon0/pwm1"

if [ "$EUID" -ne 0 ] ; then
	echo "Please run as root"
 	exit 2
elif [ -z $1 ] ; then
	echo "Parameter: PWM speed (0~255)"
	exit 1
elif [ $1 -gt 255 ] || [ $1 -lt 0 ] ; then
	echo "PWM speed invalid (0~255)"
	exit 1
fi

#echo "Updating PWM control mode: $MODE"
echo manual > $MODE
#echo "Updating PWM value: $PWM"
echo $1 > $PWM
