#!/bin/sh

setxkbmap  -query | grep layout | tr -s ' ' | cut -f 2 -d ' '
