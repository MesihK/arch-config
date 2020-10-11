#!/bin/sh

printf '%4.2fG\n' $(echo $(grep MemAva /proc/meminfo | tr -s ' ' | cut -f 2 -d' ')'/1024/1024' | bc -l)
