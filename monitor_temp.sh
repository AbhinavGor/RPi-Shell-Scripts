#!/bin/bash
SUDO=''
if [ $EUID -ne 0 ]; then
  echo "You are not root, so I will run this script as sudo..."
  SUDO='sudo'
fi

if [[ $# -eq 0 ]]; then
  echo "No arguments specified. Please specify either 'temp' or 'info'."
  exit 1;
fi

if [[ -z $1 ]]; then
  echo "Invalid argument passed. Please specify either 'temp' or 'info'."
  exit 1;
fi

if [[ $1 == "temp" ]]; then
  coreTemp = ${/opt/vc/bin/vcgencmd measure_temp | egrep -o '[0-9]*\.[0-9]*'}
  echo "The core temperature is $coreTemp degrees celsius."
  exit
fi

if [[ $1 == "info" ]]; then
  echo "----Getting CPU info----"
  cat /proc/cpuinfo
  exit
fi
