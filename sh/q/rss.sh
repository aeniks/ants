#!/bin/bash
## kkkk
for i in $(cat $ants/sh/q/.rss/urls.sh); do

rsstail -u "$i" \
-1n 4 -NpHZ"_------_------__"|tr "_" "\n"|batcat -fppl c; printf "\n\n";


done




##    https://news.google.com/rss/topics/CAAqJggKIiBDQkFTRWdvSUwyMHZNRGx1YlY4U0FtVnVHZ0pWVXlnQVAB?hl=en-US&gl=US&ceid=US:en
