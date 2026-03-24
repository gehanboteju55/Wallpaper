#!/bin/bash

dir=""
wallpapers=("$dir"/*)

echo "Pick a wallpaper:"

select wallpaper in "${wallpapers[@]}"; do
    if [[ -n "$wallpaper" ]]; then
        osascript <<EOF
tell application "System Events"
    set picture of every desktop to "$wallpaper"
end tell
EOF
        echo "Wallpaper set to: $wallpaper"
        break
    else
        echo "Try again"
    fi
done
