#!/bin/bash
# folder maker
mkd() { mkdir "$1" -pm 775 && cd "$1"; echo -e "$PWD "; ls -lG; }
