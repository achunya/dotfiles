#!/usr/bin/env bash

# Check if hypridle is currently running
if pgrep -x "hypridle" > /dev/null; then
    # If the process is found (Exit Status 0), kill it
    echo "Hypridle process found. Stopping..."
    pkill -x "hypridle"
    
    # Optional: Send a system notification (requires libnotify)
    notify-send "Hypridle" "Idle daemon stopped"
else
    # If the process is not found (Exit Status 1), start it in the background
    echo "Hypridle not running. Starting..."
    hypridle &
    
    # Optional: Send a system notification
    notify-send "Hypridle" "Idle daemon started"
fi
