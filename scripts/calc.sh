#!/bin/sh
i3-msg floating enable > /dev/null
cd /tmp
R --save --restore
