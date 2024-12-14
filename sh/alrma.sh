#!/bin/bash
alarm_time=$1
command=$2

# convert alarm_time and current_time to seconds since 1970-01-01 00:00:00 UTC
# and calculate their difference
alarm_time=$(date -d "$alarm_time" +"%s")
current_time=$(date +"%s")
diff=$(( $alarm_time - $current_time ))

# convert the time difference to hours
sleep_time=$(echo "scale=5; $diff/3600" | bc)

# run the command at the specified time
sleep "$sleep_time"h && $command
