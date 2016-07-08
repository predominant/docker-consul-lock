#!/bin/sh

MAXRUN=$(((($RANDOM % 10)) + 1))
CONTAINERID=$(cat /proc/1/cgroup | grep docker | head -n 1 | awk -F'/' '{print $3}')
CONTAINERSID=${CONTAINERID:0:12}

echo "-> Starting on Container: $CONTAINERSID"

START=$(date +%s)
while [ $(( $(date +%s) - $MAXRUN )) -lt $START ]; do
  sleep 0.2
  echo "."
done

echo "<- Exiting from Container: $CONTAINERSID"
