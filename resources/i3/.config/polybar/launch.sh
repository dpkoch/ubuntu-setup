#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Export monitor variables
export MONITOR1=$(xrandr -q | grep " connected primary" | cut -d ' ' -f1)

# TODO check if MONITOR1 is set/not empty, and if not start index at 1 instead of 2

MONITORS=$(xrandr -q | grep " connected" | cut -d ' ' -f1)
INDEX=2
for M in $MONITORS; do
  if [ $M != $MONITOR1 ]; then
    export MONITOR$INDEX=$M
    INDEX=$((INDEX+1))
  fi
done

# Launch bars
for ((i=1; i<$INDEX; i++)); do
  echo "---" | tee -a /tmp/polybar$i.log
  polybar bar$i >> /tmp/polybar$i.log 2>&1 &
done

echo "Launched $((INDEX-1)) bars"
