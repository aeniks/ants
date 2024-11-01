wifi() { unset wifi; ip a|grep wlan0|grep DOWN 1>/dev/null&& wifi=off;
if [ -z "${wifi}" ]; then wifi=on; fi; printf "\nwifi=${wifi}\n"; }; 
