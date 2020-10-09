#!/bin/sh

LVL=$(acpi | grep -Po "[0-9]+%")
acpi | grep "Discharging" > /dev/null 2>&1
if [ $? -eq 1 ]
then
	echo '<span color="#FFB52A"> </span>' $LVL
else 
	echo '<span color="#FFB52A"> </span>' '<span color="#E60053">'$LVL'</span>'
fi
