#!/bin/sh

iw dev wlp3s0 info | grep ssid | cut -f2 -d ' '
