#!/bin/bash

# Get waybar position and calculate dropdown position
WAYBAR_POS=$(hyprctl clients | grep -A 5 waybar | grep "at:" | head -1 | awk '{print $2 $3}' | tr -d ',')

# Launch networkmanager_dmenu with calculated position
exec networkmanager_dmenu
