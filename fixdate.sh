#!/bin/bash

SYSDATE=`date '+%Y%m%d%H%M%S'`
GOODDATE="20130221101118"

echo System date is $SYSDATE
echo Good date is $GOODDATE
if [ $SYSDATE -gt $GOODDATE ] 
then
echo "Date seems fine to connect to wireless"
else

echo "Date seems older than it should be, fixing for wireless connection"
date 0219000013

HOST_SW_VERS=`/usr/bin/defaults read "${1}/System/Library/CoreServices/SystemVersion" ProductVersion`
if ( echo $HOST_SW_VERS | grep "^10.5">/dev/null ); then
echo "Target OS is Leopard"
LEOPARD=0
TIGER=1		
elif ( echo $HOST_SW_VERS | grep "^10.4">/dev/null ); then
echo "Target OS is Tiger"
LEOPARD=1
TIGER=0	
elif ( echo $HOST_SW_VERS | grep "^10.6">/dev/null ); then
echo "Target OS is Snow Leopard"
LEOPARD=0
TIGER=1	
elif ( echo $HOST_SW_VERS | grep "^10.3">/dev/null ); then
echo "Target OS is Tiger"
LEOPARD=1
TIGER=0	
elif ( echo $HOST_SW_VERS | grep "^10.7">/dev/null ); then
echo "Target OS is Lion"
LEOPARD=0
TIGER=1	
elif ( echo $HOST_SW_VERS | grep "^10.8">/dev/null ); then
echo "Target OS is Mountain Lion"
LEOPARD=0
TIGER=1
else
echo "OS $HOST_SW_VERS not supported"
exit 3
fi

if [ $LEOPARD -eq 0 ]; then

sleep 15
networksetup -setairportpower airport off
sleep 15
networksetup -setairportpower airport on
sleep 15
ntpdate -u time.apple.com

else

sleep 15
ifconfig en1 down
sleep 15
ifconfig en1 up
sleep 15 
ntpdate -u time.apple.com


fi

fi
