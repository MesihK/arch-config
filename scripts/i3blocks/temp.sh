#!/bin/sh

C='<span color="#FFB52A">°C</span>'
echo $(sensors | grep Package | tr -s ' ' | cut -f 4 -d ' ' | cut -c 2- | cut -b -4)$C
