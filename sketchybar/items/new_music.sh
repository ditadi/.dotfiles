#!/bin/bash

# # Add event
# sketchybar -m --add event song_update com.apple.iTunes.playerInfo
#  sketchybar -m --add item new_music icon=X center                         \
# 		 --set new_music script="$PLUGIN_DIR/new_music.sh"  \
#      label.padding_right=10                                   \
#      drawing=off                                              \
#      --subscribe new_music song_update
# # sketchybar --add event music_change $MUSIC_EVENT \
# Add Music Item

PLUGIN_DIR="$HOME/.config/sketchybar/plugins"

previous_music=(
  icon=􀊎
  click_script="osascript -e 'tell application "Music" to play previous track'"
)
next_music=(
  icon=􀊐
  click_script="osascript -e 'tell application "Music" to play next track'"
)

sketchybar -m --add event song_update com.apple.iTunes.playerInfo

sketchybar -m --add item previous_music center \
     --set previous_music "${previous_music[@]}" \
     --add item music center                         \
		 --set music script="$PLUGIN_DIR/new_music.sh"  \
     drawing=off                                              \
     --subscribe music song_update \
     --add item next_music center \
     --set next_music "${next_music[@]}" 
     


#
# sketchybar -m --add item next_music right \
#   --set next_music icon=B
