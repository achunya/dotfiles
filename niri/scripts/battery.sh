#!/bin/bash
set -euo pipefail

bat0="/sys/class/power_supply/BAT0"
bat1="/sys/class/power_supply/BAT1"

cap0=$(cat "$bat0/capacity" 2>/dev/null || echo 0)
stat0=$(cat "$bat0/status" 2>/dev/null || echo "Unknown")

cap1=$(cat "$bat1/capacity" 2>/dev/null || echo 0)
stat1=$(cat "$bat1/status" 2>/dev/null || echo "Unknown")

printf '{"text":"BAT0 %s%% | BAT1 %s%%","tooltip":"BAT0: %s (%s%%)\\nBAT1: %s (%s%%)","class":"battery"}\n' \
  "$cap0" "$cap1" "$stat0" "$cap0" "$stat1" "$cap1"

