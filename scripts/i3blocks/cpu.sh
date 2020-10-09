#!/bin/sh
cpu=$(grep 'cpu ' /proc/stat)
sleep 1
cpu=$cpu'\n'$(grep 'cpu ' /proc/stat)
echo -e $cpu | awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else printf("%05.2f%\n",($2+$4-u1) * 100 / (t-t1)); }'
