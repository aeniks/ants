#!/bin/bash
# choose files to gist (-p) to public
lf_install() { 
mkdir -p ~/tmp/lf_bu_$(date +%F)
mv ~/.config/lf/* ~/tmp/lf_bu_$(date +%F)/
ln $ants/sh/config/lf/lfrc ~/.config/lf/ --symbolic
ln $ants/sh/config/lf/preview ~/.config/lf/ --symbolic
ln $ants/sh/config/lf/icons ~/.config/lf/ --symbolic
ln $ants/sh/config/lf/opener ~/.config/lf/ --symbolic
ln $ants/sh/config/lf/colors ~/.config/lf/ --symbolic
ln $ants/sh/config/lf/lf_m ~/.config/lf/ --symbolic
####
sudo apt install -y chafa jp2a exiftool caca-utils batcat 2>/dev/null; 
####
}
lf_install
