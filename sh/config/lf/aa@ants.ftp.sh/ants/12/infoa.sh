#!/bin/bash
# system info
# Get system information
sudo apt install jp2a batcat bat -qqy &>/dev/null;
OS=$(uname -s)
HOSTNAME=$(uname -n)
KERNEL=$(uname -r)
UPTIME=$(uptime -p | sed 's/up //')
# Get CPU information
CPU=$(grep 'model name' /proc/cpuinfo | head -n1 | awk -F: '{print $2}')
CORES=$(grep 'cpu cores' /proc/cpuinfo | head -n1 | awk -F: '{print $2}')
# Get memory information
MEMORY=$(grep 'MemTotal' /proc/meminfo | awk -F: '{print $2}')
# Get GPU information (if available)
GPU=$(lspci | grep -i vga | awk -F: '{print $3}')
# Print ASCCI art if .face.icon is present, uncomment
jp2a ~/.face.icon --size=40x20 --colors;
# Output the information
printf "\e[AOS: $OS
Hostname: $HOSTNAME
Kernel: $KERNEL
Packages: $PKG
Uptime: $UPTIME
CPU: $CPU
CPU cores: $CORES
Memory: $MEMORY
GPU: $GPU
"|batcat -p --language cpuinfo; 
