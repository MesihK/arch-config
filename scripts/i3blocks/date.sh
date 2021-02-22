#!/bin/sh

case $BLOCK_BUTTON in
	3) notify-send "$(TZ='US/Central' date +'%d/%m/%Y %H:%M' && TZ='Turkey' date +' %H:%M')" "$(cal)";;
	#3) notify-send "$(date +'%d/%m/%Y')" "$(cal)" ;;
esac

echo $LABEL$(date +'%m/%d %H:%M')
