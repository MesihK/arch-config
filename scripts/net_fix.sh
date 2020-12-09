#!/bin/sh
RED='\033[0;31m'
GREEN='\033[0;32m'
YEL='\033[0;33m'
NC='\033[0m'

function info(){
	echo -e $YEL$1$NC
}
function err(){
	echo -e $RED$1$NC
}
function green(){
	echo -e $GREEN$1$NC
}

function printHelp(){
info 'Usage: '
info '-h	prints this message'
info '-f	force restart'
}

#if -f is used, don't check current connection
skipNetCheck=0
while getopts "fh" OPTION; do
    case $OPTION in
    h)
	printHelp
	exit 1;
        ;;
    f)
	skipNetCheck=1
        ;;
    *)
	printHelp
        exit 1
        ;;
    esac
done

if [ $skipNetCheck -eq 0 ]
then
	ping -c 1 google.com > /dev/null 2>&1
	if [ $? -eq 0 ] 
	then
		notify-send 'Internet connection is OK, exiting!'
		exit 1
	fi
fi

ETH=$(dmesg | grep renamed | grep -Po "enp[0-9]+s[0-9]+")
WAN=$(dmesg | grep renamed | grep -Po "wlp[0-9]+s[0-9]+")

info 'kill wpa_supplicant and dhcpcd'
sudo killall -s 2 wpa_supplicant
sudo killall -s 2 dhcpcd
#send exit message to all dhcpcd
#dhcpcd -x

#check if these processes died
cnt=0;
for (( ; ; ))
do
	isAlive=$(ps aux | grep -P "(wpa_supplicant|dhcpcd)" | wc -l)
	if [ $isAlive -eq 1 ]
	then
		info 'kill succesful'
		break;
	else
		cnt+=1
		if [ $cnt -gt 10 ]
		then
			notify-send 'wpa_supplicant and dhcpcd kill unsuccesful'
			exit 0
		fi
		sleep 1;
	fi
done

WIFI=$(cat /etc/wpa_supplicant/selected)
info "restart wifi:  $WIFI"

sudo ifconfig $ETH up
sudo ifconfig $WAN up

sudo wpa_supplicant -B -i $WAN -c /etc/wpa_supplicant/$WIFI.conf 
sudo dhcpcd $WAN &
sudo dhcpcd $ETH

ping -c 1 google.com > /dev/null 2>&1
if [ $? -eq 0 ] 
then
	notify-send 'Succesfuly Connected!'
	exit 1
else
	notify-send 'Connection Failed!'
	exit 0
fi
