



## to save stauu



notes() {
cat $ants/sh/notes.sh; echo;echo; 
read -rep ":" "note";
printf " \n\n-- $(date +%D) --
---------------
${note} 
---------------
\n\n " >> $ants/sh/notes.sh; 

}
notes
