#!/bin/bash
## wrangler
read -n1 -ep  "$c2 serve $PWD/? "; 
npx wrangler pages dev . 2>/dev/null
