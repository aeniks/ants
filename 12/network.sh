#!/bin/bash
## local area
ip n | grep -v FAILED|head -n-1
