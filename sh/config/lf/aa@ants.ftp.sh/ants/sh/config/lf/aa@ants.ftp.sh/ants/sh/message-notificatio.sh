#!/bin/bash
msg=($(ls)); notify-send -u critical -i folder -p $msg -A "wall gggg"="wall gg" "${msg[*]} "|bash 2>/dev/null 
