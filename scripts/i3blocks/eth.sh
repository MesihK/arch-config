#!/bin/sh

ifconfig | grep -A2 enp0s25 | grep -Po 'inet [0-9.]+' | cut -f2 -d' '
