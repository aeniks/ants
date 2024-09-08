#!/bin/bash
## show network local ip
ip route |tail -n1|cut --fields=9 --delimiter=" ";
