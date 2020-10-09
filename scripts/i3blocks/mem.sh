#!/bin/sh

printf '% 5.2f\n' $(echo $(grep MemAva /proc/meminfo | tr -s ' ' | cut -f 2 -d' ')'/1024/1024' | bc -l)
