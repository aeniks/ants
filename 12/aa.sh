#!/bin/bash
## menu for functions 
grep "()" $ants/alias.sh -A1 --group-separator="$(echo -e " \n + +\n ")"|tr -s '(){' "  \n"|batcat -fPp --language c++ --theme DarkNeon 
