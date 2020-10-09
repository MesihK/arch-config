#!/bin/sh

echo $LABEL $(TZ='US/Central' date +'%d/%m/%Y %H:%M' && TZ='Turkey' date +' %H:%M')
