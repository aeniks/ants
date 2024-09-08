#!/bin/bash
## sync
rsync --exclude=".git" /ants 192.168.0.100: -hav
