#!/bin/bash

cd ~

# First we shoul update
apt-get update

# For 32 bit applications
dpkg --add-architecture i386

# Load the bbswitch module
modprobe bbswitch load_state=0

# Install Bumblebee Nvidia Driver and extra tool
apt-get install nvidia-kernel-dkms nvidia-xconfig nvidia-smi nvidia-settings primus libgl1-nvidia-glx

apt-get install bumblebee-nvidia

apt-get install libcuda1

# For 32 bit
sudo apt-get install primus-libs:i386 libgl1-nvidia-glx:i386

# Add user to Bumblebee Group. 
# The first time you install Bumblebee, the bumblebee group has to be created.
# Users who are allowed to use Bumblebee need to be added to the group:
# groupadd bumblebee
adduser $USER bumblebee

#
cd /usr/share/applications
sed -i 's/Exec=nvidia-settings/optirun nvidia-settings -c :8/g' nvidia-settings.desktop

# Restart
reboot
