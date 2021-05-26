#!/usr/bin/env bash

sleep 30

ScriptName=keepalivedcheck.sh
LOGPATH=/var/log/telnet
CURRENTDATE=`date +"%Y-%m-%d %T"`
Today=`date +%F`
PID=`ps -eaf | grep $ScriptName | grep -v grep | awk '{print $2}'`
if [[ "" !=  "$PID" ]]; then
  echo ${CURRENTDATE} "PRECHECK: $ScriptName is still running using $PID..." >> $LOGPATH/keepalivedprecheck_${Today}.txt
  echo ${CURRENTDATE} "PRECHECK: killing $PID" >> $LOGPATH/keepalivedprecheck_${Today}.txt
  kill -9 $PID
  if [ $? -eq 0 ]; then
   echo ${CURRENTDATE} "PRECHECK: Killing sucess for PID:$PID" >> $LOGPATH/keepalivedprecheck_${Today}.txt
  fi
else echo ${CURRENTDATE} "PRECHECK: $ScriptName is not running." >> $LOGPATH/keepalivedprecheck_${Today}.txt
fi
