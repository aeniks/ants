#!/bin/bash
## reduce
haha=($(wc -l haha.sh)); if (("$haha">4)); then tail haha.sh -n 4 > haha2.sh; rm haha.sh; mv haha2.sh haha.sh;  fi
