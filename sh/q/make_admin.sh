#!/bin/bash
## create super user froom root
if [ -e != /etc/sudoers.d/admins ]; 
then sudo touch /etc/sudoers.d/admins; fi; 
sudo chmod 775 /etc/sudoers.d/admins && 
read -rep " $c2 Add as admin-user: " "newsudo" && sudo echo -e "
$newsudo ALL=(ALL) NOPASSWD:ALL
%"$newsudo" ALL=(ALL) NOPASSWD:ALL \n" >> "/etc/sudoers.d/admins"
