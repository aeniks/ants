#!/bin/bash
## note on hour
vader="$(curl -sm2 http://wttr.in/sthlm?format=%l:+%c+%t+/+%f++|tr -s "\n \t-" " ";)"
if [ "${#vader}" -gt 2 ];then vader="${vader^^}"; 
vader="${vader:0:(-1)}"; else vader="nothing good on \e[1m):\e[0m "; 
fi; 
##################################
day="$(date +%D)"
not="-r $(notify-send -c critical -p -a "$day" "$day")";
##
##
for i in {1..60}; do timeout 2 notify-send -a "  $(date +%X)   ${day} " "  $(echo -e "$(shuf -n1 /ants/sh/config/emojiline.sh) $(date +%X) $(shuf -n1 /ants/sh/config/emojiline.sh)")"  $not -A "$(
 date +"  ---- "%#A" -- den "%d:de" -- %#B"" ---- den "%j:de" dagen pa "%Y" ----")"=" $(date +%n-%X-%n) " "  ${vader}"; if [ "${i}" -gt 22 ]; then unset not; $((day++)) fi; done|~/log.log; 
#####################################
#####################################



