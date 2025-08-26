#!/usr/bin/sh

# Terminate already running bar instances
kill $(pidof polybar) &> /dev/null || true

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch top bar
for i in $(polybar -m | awk -F: '{print $1}'); do MONITOR=$i polybar example -c ~/.config/polybar/config & done

echo "Bars launched..."
