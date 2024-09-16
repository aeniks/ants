#!/bin/bash
## repo
read -rep "folder: " -i "$PWD" "gfgf"; 
mkdir -p -m 775 $gfgf;
cd gfgf; 
git init -b main
git add .
git commit -m "First commit"
