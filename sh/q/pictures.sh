#!/bin/bash
## screensaver for terminal with img slide-show
pslides() {
[ "$1" ]||pslides="$HOME/Pictures"||pslides="~"; 
for i in ${pslides}/*.jpg; do chafa $i; printf "$i"; sleep 4; jp2a $i --color-depth=8; printf "$i"; sleep 4; done; 
}
