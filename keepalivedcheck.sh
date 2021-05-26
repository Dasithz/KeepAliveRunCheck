#!/usr/bin/env bash
SERVER=10.5.79.20
PORT=443
LOGPATH=/var/log/keepalivedcheck
CURRENTDATE=`date +"%Y-%m-%d %T"`
Today=`date +%F`

nc -zv $SERVER $PORT -w 5 > /dev/null 2>&1
if [ "$?" -ne 0 ]; then
  echo ${CURRENTDATE} "Connection to $SERVER on port $PORT failed" >> $LOGPATH/keepalivedcheck_${Today}.txt
  echo ${CURRENTDATE} "restarting the keepalived service" >> $LOGPATH/keepalivedcheck_${Today}.txt
  systemctl reload keepalived
     if [ $? -eq 0 ]; then
       echo ${CURRENTDATE} "keepalived service restarted sucessfully" >> $LOGPATH/keepalivedcheck_${Today}.txt
     else
       echo ${CURRENTDATE} "keepalived service failed to restart. Please restart manually." >> $LOGPATH/keepalivedcheck_${Today}.txt
     fi
exit 1
else
  echo ${CURRENTDATE} "Connection to $SERVER on port $PORT succeeded" >> $LOGPATH/keepalivedcheck_${Today}.txt
  exit 0
fi
