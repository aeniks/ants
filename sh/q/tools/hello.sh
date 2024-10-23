for i in {1..222}; do printf "[38;5;${i}m



"; figlet -f DOS_Rebel "hello!" -w $COLUMNS -c; printf "[14A"; sleep .1; done