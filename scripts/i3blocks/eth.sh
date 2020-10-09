#!/bin/sh

ifconfig | grep -A2 enp8s0 | grep -Po 'inet [0-9.]+' | cut -f2 -d' '
