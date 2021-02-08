#!/bin/bash

if ![ $(id -u) = 0]; then
   echo "You are not root! This script must be run as root"
   exit 1
fi

cd ~

# First we shoul update
apt-get -y update

# For 32 bit applications
dpkg --add-architecture i386

# Load the bbswitch module
modprobe bbswitch load_state=0

# Install Bumblebee Nvidia Driver and extra tool
apt-get -y install nvidia-kernel-dkms nvidia-xconfig nvidia-smi nvidia-settings primus libgl1-nvidia-glx

apt-get -y install bumblebee-nvidia

apt-get -y install libcuda1

# For 32 bit
apt-get -y install primus-libs:i386 libgl1-nvidia-glx:i386

# Add user to Bumblebee Group. 
# The first time you install Bumblebee, the bumblebee group has to be created.
# Users who are allowed to use Bumblebee need to be added to the group:
# groupadd bumblebee
adduser $USER bumblebee

#
cd /usr/share/applications
sed -i 's/Exec=nvidia-settings/optirun nvidia-settings -c :8/g' nvidia-settings.desktop

# Restart
systemctl reboot



