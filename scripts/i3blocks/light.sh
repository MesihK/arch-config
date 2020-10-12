#!/bin/sh

case $BLOCK_BUTTON in
	4) sudo light -A 10 ;;
	5) sudo light -U 10 ;;
esac

echo '<span color="#ffb52a">' '</span>'$(printf '%03.0f' $(light))%
