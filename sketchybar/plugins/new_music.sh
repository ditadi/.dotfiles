#!/usr/bin/env bash

# FIXME: Running an osascript on an application target opens that app
# This sleep is needed to try and ensure that theres enough time to
# quit the app before the next osascript command is called. I assume 
# com.apple.iTunes.playerInfo fires off an event when the player quits
# so it imediately runs before the process is killed
sleep 1

APP_STATE=$(pgrep -x Music)
if [[ ! $APP_STATE ]]; then 
    sketchybar -m --set music drawing=off
    exit 0
fi

PLAYER_STATE=$(osascript -e "tell application \"Music\" to set playerState to (get player state) as text")
if [[ $PLAYER_STATE == "stopped" ]]; then
    sketchybar --set music drawing=off
    exit 0
fi


title=$(osascript -e 'tell application "Music" to get name of current track')
artist=$(osascript -e 'tell application "Music" to get artist of current track')
# ALBUM=$(osascript -e 'tell application "Music" to get album of current track')
loved=$(osascript -l JavaScript -e "Application('Music').currentTrack().loved()")
if [[ $loved ]]; then
    icon=""
fi

if [[ $PLAYER_STATE == "paused" ]]; then
    icon=""
fi

if [[ $PLAYER_STATE == "playing" ]]; then
    icon=""
fi

if [[ ${#title} -gt 25 ]]; then
TITLE=$(printf "$(echo $title)")
fi

if [[ ${#artist} -gt 25 ]]; then
ARTIST=$(printf "$(echo $artist)")
fi

# if [[ ${#ALBUM} -gt 25 ]]; then
#   ALBUM=$(printf "$(echo $ALBUM | cut -c 1-12)…")
# fi

# next_song=(

#   p
# volume_icon=(
#   click_script="$PLUGIN_DIR/volume_click.sh"
#   padding_left=10
#   icon=$VOLUME_100
#   icon.width=0
#   icon.align=left
#   icon.color=$GREY
#   icon.font="$FONT:Regular:14.0"
#   label.width=25
#   label.align=left
#   label.font="$FONT:Regular:14.0"
#  )


sketchybar -m --set music icon="$icon"          \
    --set music label="${title} - ${artist}"    \
    --set music drawing=on                      \ 
