#!/bin/bash

shopt -s nullglob

dir=""
wallpapers=("$dir"/*)

echo "Pick a wallpaper:"

select wallpaper in "${wallpapers[@]##*/}"; do
    if [[ -n "$wallpaper" ]]; then
        full="$dir/$wallpaper"

         osascript <<EOF
tell application "System Events"
    set picture of every desktop to "$full"
end tell
EOF
        echo "Wallpaper set to: $wallpaper"
        break
    else
        echo "Try again"
    fi
done
