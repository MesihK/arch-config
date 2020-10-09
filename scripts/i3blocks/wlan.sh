#!/bin/sh

iw dev wlp2s0 info | grep ssid | cut -f2 -d ' '
