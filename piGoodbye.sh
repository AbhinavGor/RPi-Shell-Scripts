#!/bin/bash
SUDO=''
if [ $EUID -ne 0 ]; then
  echo "You are not root, so I will run this script as sudo..."
  SUDO='sudo'
fi

if [[ $# -eq 0 ]]; then
  echo "No arguments specified. Please specify either 'bye' or 'reboot'."
  exit 1;
fi

if [[ -z $1 ]]; then
  echo "Invalid argument passed. Please specify either 'bye' or 'reboot'."
  exit 1;
fi

if [[ $1 == "reboot" ]]; then
  echo "-----R E B O O T I N G----"
  $SUDO reboot
  exit
fi

if [[ $1 == "bye" & $2 ]]; then
  echo "----S H U T T I N G  D O W N----"
  $SUDO shutdown -h $2
  exit
fi

if [[ $1 == "bye" ]]; then
  echo "----S H U T T I N G  D O W N----"
  $SUDO shutdown -h now
  exit
fi