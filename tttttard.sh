
for i in {1..99}; do echo -e "\e[H\e[48m"; jp2a media/tard.jpg --color-depth=8 --chars="$(shuf -n11 /usr/share/dict/words|tr "\n" " " )"; sleep .1; done
