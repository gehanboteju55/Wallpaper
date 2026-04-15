#!/bin/bash

shopt -s nullglob

dir=""
wallpapers=("$dir"/*)

echo "Syncing..."
git -C "$dir" pull origin main

echo "Pick a wallpaper:"

select wallpaper in "${wallpapers[@]##*/}"; do
    if [[ -n "$wallpaper" ]]; then
        full="$dir/$wallpaper"

        awww img $full --transition-type random --transition-fps 179

        echo "Wallpaper set to: $wallpaper"
        break
    else
        echo "Try again"
    fi
done
