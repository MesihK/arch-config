#!/bin/sh

case $BLOCK_BUTTON in
	4) setxkbmap tr ;;
	5) setxkbmap us ;;
esac

setxkbmap  -query | grep layout | tr -s ' ' | cut -f 2 -d ' '
