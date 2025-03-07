#!/bin/bash

# Battery info path (it may vary depending on your system)
BATTERY_PATH="/sys/class/power_supply/BAT0"

# Check if the battery exists
if [[ -d "$BATTERY_PATH" ]]; then
  # Get battery percentage
  PERCENTAGE=$(cat "$BATTERY_PATH"/capacity)

  # Get charging status
  STATUS=$(cat "$BATTERY_PATH"/status)

  # Determine if charging or discharging
  if [[ "$STATUS" == "Charging" ]]; then
    echo "%icon(battery-charging) $PERCENTAGE%"
  elif [[ "$STATUS" == "Discharging" ]]; then
    echo "%icon(battery-empty) $PERCENTAGE%"
  else
    echo "%icon(battery-full) $PERCENTAGE%"
  fi
else
  echo "Battery not found"
fi

