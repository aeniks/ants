#!/bin/bash
## font patcher
sudo apt install -y python3 python3-fontforge fontforge argparse 2>/dev/null; 
fontforge --script ./fontpatcher/font-patcher  ./fontpatcher/HackNerdFontMono-Regular.ttf 
fontforge --script ./fontpatcher/font-patcher  /usr/share/fonts/truetype/liberation/LiberationMono-Regular.ttf
