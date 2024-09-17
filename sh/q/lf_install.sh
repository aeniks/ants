#!/bin/bash
# choose files to gist (-p) to public
lf_install() { 
sudo apt install -y lf chafa jp2a exiftool caca-utils batcat 2>/dev/null; 
mkdir -p ~/.config/lf 
mkdir -p ~/tmp/lf_bu_$(date +%F)
mv ~/.config/lf/* ~/tmp/lf_bu_$(date +%F)/
ln $ants/sh/config/lf/lfrc ~/.config/lf/ --symbolic
ln $ants/sh/config/lf/previewer ~/.config/lf/ --symbolic
ln $ants/sh/config/lf/icons ~/.config/lf/ --symbolic
ln $ants/sh/config/lf/opener ~/.config/lf/ --symbolic
ln $ants/sh/config/lf/colors ~/.config/lf/ --symbolic
ln $ants/sh/config/lf/lf_m ~/.config/lf/ --symbolic
####
####
}
lf_install
