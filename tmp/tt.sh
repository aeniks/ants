if [ $UID != 0 ]; then echo hello; fi; sudo echo $SUDO_USER $USER


tf() {
tput setaf $((RANDOM%16));
}
tb() {
tput setaf $((RANDOM%16));
}
pro() { 
c2=""$cyan"--"$re""; tput civis; tput sgr0; sudo touch ./.x; 
$1 $2 $3 $4 &>./.x & disown; tput cuu1; PROC_ID=$!; while kill -0 "$PROC_ID" &>/dev/null; 
do for X in "[        ]" "[$(tf)=$re       ]" "[$(tf)=$(tf)=$re      ]" "[$(tf)=$(tf)=$(tf)=$re     ]" "[$(tf)=$(tf)=$(tf)=$(tf)=    $re]"  \
"[ $(tf)=$(tf)=$(tf)=$(tf)=   $re]" "[  $(tf)=$(tf)=$(tf)=$(tf)=$re  ]" "[   $(tf)=$(tf)=$(tf)=$(tf)= $re]" "[    $(tf)=$(tf)=$(tf)=$(tf)=$re]" \
"[     "$(tf)"=$(tf)=$(tf)=$re]" "[      "$(tf)"=$(tf)="$re"]" "[       $(tf)=]" "[        ]" "[        ]" "[        ]"; 
do echo -e "    $dim[$(tb)  $re$dim]$re "$c2" Executing $rev $1 $2 $3 $4 $re $c2$c2$c2$c2$c2"; tput cuu1; tput sgr0; echo -e "\t\t\t\t\t $X"; tput cuu1; sleep 0.1; 
tput sc; tput cup $((LINES-4)) 0; echo -e "\t$darkblue $(tail -n2 ./.x|head -n1) $re"; echo -e "\t$yellow $(tail -n1 ./.x) $re"; tput cuu 2; tput rc; 
done; done; echo -e "\t\t\t\t\t"$dim" [$re  "$green"DONE"$re" $dim ]$re "; tput cnorm; rm ./.x &>/dev/null;
}
###########
## Y/N ####
yno() {
if [ -z "$1" ]; then echo -e "\n\t $c2 Try$dim ["$re"yno question? command 1"$dim"]$re and use quotes...\n"; fi; 
echo -e "\n\n\t $re$c2 $1 $white$dim["$re$bold"Y$dim/"$re$bold"n$dim]$re $(tput sc)\n\n\n\n"; tput rc cuu 5; read -n1 yn; 
if [ "$yn" == "${yn#[Nn]}" ]; then echo -en "\t $c2 OK"; pro $2; else echo "nope"; fi;  
}