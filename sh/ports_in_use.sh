
for i in {1..1024}; do (exec 2>&-; echo > /dev/tcp/localhost/$i && echo $i is open); read -t .2 -n1 -re "qq"; [ "$qq" ]&& (break; echo ok;); done; echo ok; 
