#!/bin/sh
cpu=$(grep 'cpu ' /proc/stat)
sleep 1
cpu=$cpu'\n'$(grep 'cpu ' /proc/stat)
cpu=$(echo -e $cpu | awk '{u=$2+$4; t=$2+$4+$5; if (NR==1){u1=u; t1=t;} else printf("%02.0f%",($2+$4-u1) * 100 / (t-t1)); }')
label='<span color="#e60053"> </span>'
echo '<span font="pango monospace">'$cpu'</span>'$label

