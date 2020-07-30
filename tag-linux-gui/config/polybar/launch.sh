#!/bin/bash

# Terminate already running bar instances
killall -q polybar

HOSTNAME=$(hostname)

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar, using default config location ~/.config/polybar/config
if [ $HOSTNAME == 'krrl' ]; then
    polybar desktop-left &
    polybar desktop-right &
else
    polybar laptop &
fi


echo "Polybar launched..."
