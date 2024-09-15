#!/bin/bash
## menu thing

if [ "$(id -u)" ]
for i in $(seq $((LINES-2))); do printf "\n"; sleep .04; done; 
for i in $(seq $((LINES-6))); do printf "\e[1A"; sleep .04; done; 
printf "hello\n"; 

