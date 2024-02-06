#!/bin/bash

next ()
{
  ~/.local/bin/nowplaying-cli next
}

back () 
{
  ~/.local/bin/nowplaying-cli previous
}

play () 
{
  ~/.local/bin/nowplaying-cli togglePlayPause
}

update ()
{
  PLAYING=1
  TRACK="$(~/.local/bin/nowplaying-cli get title)"
  if [ "$TRACK" != "null" ]; then
    PLAYING=0
    ARTIST="$(~/.local/bin/nowplaying-cli get artist)"
    ALBUM="$(~/.local/bin/nowplaying-cli get album)"
    APP="$(base64 -d <<< $(~/.local/bin/nowplaying-cli get clientPropertiesData) | awk -F ':' '{print $2}')"
    MEDIA="$APP: $TRACK - $ARTIST"
    PLAYBACK_RATE=$(~/.local/bin/nowplaying-cli get playbackRate)
  fi

  args=()
  if [ $PLAYING -eq 0 ]; then
    ~/.local/bin/nowplaying-cli get artworkData | base64 --decode > /tmp/cover.jpg
    if [ "$ARTIST" == "" ]; then
      args+=(--set media_ctrl.title label="$TRACK"
             --set media_ctrl.album label="Podcast"
             --set media_ctrl.artist label="$ALBUM"  )
    else
      args+=(--set media_ctrl.title label="$TRACK"
             --set media_ctrl.album label="$ALBUM"
             --set media_ctrl.artist label="$ARTIST")
    fi
    args+=(--set media_ctrl.play icon=􀊆
           --set media_ctrl.cover background.image="/tmp/cover.jpg"
                               background.color=0x00000000
           --set media_ctrl.anchor label="$MEDIA" drawing=on                      )
    if [ "$PLAYBACK_RATE" -eq 0 ]; then
      args+=(--set media_ctrl.play icon=􀊄                         )
    fi
  fi
  sketchybar -m "${args[@]}"
}

mouse_clicked () {
  case "$NAME" in
    "media_ctrl.next") next
    ;;
    "media_ctrl.back") back
    ;;
    "media_ctrl.play") play
    ;;
    *) exit
    ;;
  esac
}

popup () {
  sketchybar --set media_ctrl.anchor popup.drawing=$1
}

routine() {
  case "$NAME" in
    *) update
    ;;
  esac
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  "mouse.entered") popup on
  ;;
  "mouse.exited"|"mouse.exited.global") popup off
  ;;
  "routine") routine
  ;;
  "forced") exit 0
  ;;
  *) update
  ;;
esac
