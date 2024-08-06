#!/bin/bash
## linefiller
## https://github.com/aeniks
it() { size=($(stty size)); if [ -z $1 ]; then 
echo -e "\n$c2 use with args like [it] +[character] +[lentgh] (default cols) \n";
else [ $2 ] && size+=($2); for i in $(seq ${size[-1]}); do echo -ne "$1"; done; fi; }; 
################### enjoy!