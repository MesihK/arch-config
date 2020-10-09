#!/bin/sh

df /dev/sda1 -h | tail -n 1 | tr -s ' ' | cut -d ' ' -f 4
