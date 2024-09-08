#!/bin/bash
## transfer over lan via rsync
printf "\n";
read -rp 'rsync /ants 192.168.0.100:~/zynca/ --exclude ".git" -aPv   --ok?' 'kk';
rsync /ants 192.168.0.100:~/zynca/ --exclude ".git"  -aPv;
printf "\n";
