#!/bin/bash 
sudo apt -y install git gh 2>/dev/null;
gpg -o /tmp/gh.txt -d /ants/sh/gh.gpg
gh auth login --with-token < /tmp/gh.txt
gh auth status; echo; rm /tmp/gh.txt;
