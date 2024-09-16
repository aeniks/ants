#!/bin/bash
figlist=($(figlist|batcat -pp --line-range 4:|head -n-5)); 
f1="$(shuf -n1 -e ${figlist[@]})"; f2="$(shuf -n1 -e ${figlist[@]})";
figlet -f "$f1" "h_e_l_l_o" | tee -a /home/aa/issues.net  > "/etc/issue.net"; 
figlet -f "$f2" "h_e_l_l_o" | tee -a /home/aa/issues > "/etc/issue"; 
sudo chown aa: /home/aa/issues*; 
sudo chmod 775 /home/aa/issues*; 
#rsync /home/aa/issues.net /home/aa/issues aa@192.168.0.100:/home/aa/
