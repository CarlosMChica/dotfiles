#!/usr/bin/env sh

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 3; done

for i in $(polybar -m | awk -F: '{print $1}'); do POLYBAR_MONITOR=$i polybar top & done

