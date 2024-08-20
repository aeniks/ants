#!/bin/bash
## local area
ip -c n | grep -v FAILED|head -n-1
