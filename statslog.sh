#!/bin/bash

#Requires iStats: sudo gem install iStats

#temp, cpu, iops, gpu, network, etc

#Lol gross as shit
iostatformat='{print "KB/t: "$1,"tps: "$2,"MB/s: "$3,"cpu user%: "$4,"cpu sys%: "$5,"cpu idle%: "$6,"load 1m: "$7,"load 5m: "$8,"load 15m: "$9}'

echo $(date "+%Y-%m-%d %H:%M:%S") "," \
  $(sysctl hw.cpufrequency) "," \
  $(istats cpu temp | awk '{print $1,$2,$3}') "," \
  $(istats fan speed | awk '{print $1,$2,$3,$4,$5}') "," \
  $(istats battery temp | awk '{print $1,$2,$3}') "," \
  $(iostat -w 1 -c 2 disk0 | awk '{if (NR>3) {print}}' | awk "$iostatformat")


# iostat -w 1 -c 2 disk0 | awk '{if (NR>3) {print}}'
