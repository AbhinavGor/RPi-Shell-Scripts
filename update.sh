#!/bin/sh
echo "Initiating OS update."
sudo apt-get update
sudo apt-get upgrade
sudo rpi-update
sudo apt-get autoremove
sudo apt-get autoclean
sudo reboot