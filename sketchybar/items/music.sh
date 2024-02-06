# #!/bin/bash

POPUP_SCRIPT="sketchybar -m --set media_ctrl.anchor popup.drawing=toggle"

media_ctrl_anchor=(
    script="$PLUGIN_DIR/media_ctrl.sh"
    click_script="$POPUP_SCRIPT"
    popup.horizontal=on
    popup.align=center
    popup.height=150
)

media_ctrl_cover=(
    script="$PLUGIN_DIR/media_ctrl.sh"
    click_script="open -a 'Arc'; $POPUP_SCRIPT"
    label.drawing=off
    icon.drawing=off
    padding_left=12
    padding_right=10
    background.image.scale=0.6
    background.image.drawing=on
    background.drawing=on
)

media_ctrl_title=(
    icon.drawing=off
    padding_left=0
    padding_right=0
    width=0
    label.font="$FONT:Heavy:15.0"
    label.max_chars=25
    y_offset=55
)

media_ctrl_artist=(
    icon.drawing=off
    y_offset=30
    padding_left=0
    padding_right=0
    width=0
    label.max_chars=20
)

media_ctrl_album=(
    icon.drawing=off
    padding_left=0
    padding_right=0
    y_offset=15
    width=0
    label.max_chars=30
)

media_ctrl_back=(
    icon=􀊎
    icon.padding_left=5
    icon.padding_right=5
    icon.color=$BLACK
    script="$PLUGIN_DIR/media_ctrl.sh"
    label.drawing=off
    y_offset=-45
)

media_ctrl_play=(
    icon=􀊔
    background.height=40
    background.corner_radius=20
    width=100
    align=center
    background.color=$POPUP_BACKGROUND_COLOR
    background.border_color=$WHITE
    background.border_width=0
    background.drawing=on
    icon.padding_left=4
    icon.padding_right=5
    updates=on
    label.drawing=off
    script="$PLUGIN_DIR/media_ctrl.sh"
    y_offset=-45
)

media_ctrl_next=(
    icon=􀊐
    icon.padding_left=5
    icon.padding_right=5
    icon.color=$BLACK
    label.drawing=off
    script="$PLUGIN_DIR/media_ctrl.sh"
    y_offset=-45
)

media_ctrl_controls=(
    background.color=$GREEN
    background.corner_radius=11
    background.drawing=on
    y_offset=-45
)

echo $media_ctrl

sketchybar --add item media_ctrl.anchor center                      \
    --set media_ctrl.anchor "${media_ctrl_anchor[@]}"           \
    --subscribe media_ctrl.anchor mouse.entered mouse.exited \
    mouse.exited.global media_change \
    \
    --add item media_ctrl.cover popup.media_ctrl.anchor         \
    --set media_ctrl.cover "${media_ctrl_cover[@]}"             \
    \
    --add item media_ctrl.title popup.media_ctrl.anchor         \
    --set media_ctrl.title "${media_ctrl_title[@]}"             \
    \
    --add item media_ctrl.artist popup.media_ctrl.anchor        \
    --set media_ctrl.artist "${media_ctrl_artist[@]}"           \
    \
    --add item media_ctrl.album popup.media_ctrl.anchor         \
    --set media_ctrl.album "${media_ctrl_album[@]}"             \
    \
    --add item media_ctrl.back popup.media_ctrl.anchor          \
    --set media_ctrl.back "${media_ctrl_back[@]}"               \
    --subscribe media_ctrl.back mouse.clicked                \
    \
    --add item media_ctrl.play popup.media_ctrl.anchor          \
    --set media_ctrl.play "${media_ctrl_play[@]}"               \
    --subscribe media_ctrl.play mouse.clicked media_change   \
    \
    --add item media_ctrl.next popup.media_ctrl.anchor          \
    --set media_ctrl.next "${media_ctrl_next[@]}"               \
    --subscribe media_ctrl.next mouse.clicked                \
    \
    --add item media_ctrl.spacer popup.media_ctrl.anchor        \
    --set media_ctrl.spacer width=5                          \
    \
    --add bracket media_ctrl.controls media_ctrl.back           \
    media_ctrl.play           \
    media_ctrl.next           \
    --set media_ctrl.controls "${media_ctrl_controls[@]}"

#
# MUSIC_EVENT="com.apple.music.PlaybackStateChanged"
# POPUP_SCRIPT="sketchybar -m --set music.anchor popup.drawing=toggle"
#
# /bin/bash $PLUGIN_DIR/music.sh
#
# music_anchor=(
#   script="$PLUGIN_DIR/music.sh"
#   click_script="$POPUP_SCRIPT"
#   popup.horizontal=on
#   popup.align=center
#   popup.height=150
#   icon=
#   icon.font="$FONT:Regular:25.0"
#   label.drawing=on
#   drawing=on
#   y_offset=2
# )
#
# music_cover=(
#   script="$PLUGIN_DIR/music.sh"
#   click_script="open -a 'Music'; $POPUP_SCRIPT"
#   label.drawing=off
#   icon.drawing=off
#   padding_left=12
#   padding_right=10
#   background.image.scale=0.2
#   background.image.drawing=on
#   background.drawing=on
# )
#
# music_title=(
#   icon.drawing=off
#   padding_left=0
#   padding_right=0
#   width=0
#   label.font="$FONT:Heavy:15.0"
#   y_offset=55
# )
#
# music_artist=(
#   icon.drawing=off
#   y_offset=30
#   padding_left=0
#   padding_right=0
#   width=0
# )
#
# music_album=(
#   icon.drawing=off
#   padding_left=0
#   padding_right=0
#   y_offset=15
#   width=0
# )
#
# music_state=(
#   icon.drawing=on
#   icon.font="$FONT:Light Italic:10.0"
#   icon.width=35
#   icon="00:00"
#   label.drawing=on
#   label.font="$FONT:Light Italic:10.0"
#   label.width=35
#   label="00:00"
#   padding_left=0
#   padding_right=0
#   y_offset=-15
#   width=0
#   slider.background.height=6
#   slider.background.corner_radius=1
#   slider.background.color=$GREY
#   slider.highlight_color=$GREEN
#   slider.percentage=40
#   slider.width=115
#   script="$PLUGIN_DIR/music.sh"
#   update_freq=1
#   updates=when_shown
# )
#
# music_shuffle=(
#   icon=􀊝
#   icon.padding_left=5
#   icon.padding_right=5
#   icon.color=$BLACK
#   icon.highlight_color=$GREY
#   label.drawing=off
#   script="$PLUGIN_DIR/music.sh"
#   y_offset=-45
# )
#
# music_back=(
#   icon=􀊎
#   icon.padding_left=5
#   icon.padding_right=5
#   icon.color=$BLACK
#   script="$PLUGIN_DIR/music.sh"
#   label.drawing=off
#   y_offset=-45
# )
#
# music_play=(
#   icon=􀊈
#   background.height=40
#   background.corner_radius=20
#   width=40
#   align=center
#   background.color=$POPUP_BACKGROUND_COLOR
#   background.border_color=$WHITE
#   background.border_width=0
#   background.drawing=on
#   icon.padding_left=4
#   icon.padding_right=5
#   updates=on
#   label.drawing=off
#   script="$PLUGIN_DIR/music.sh"
#   y_offset=-45
# )
#
# music_next=(
#   icon=􀊐
#   icon.padding_left=5
#   icon.padding_right=5
#   icon.color=$BLACK
#   label.drawing=off
#   script="$PLUGIN_DIR/music.sh"
#   y_offset=-45
# )
#
# music_repeat=(
#   icon=
#   icon.highlight_color=$GREY
#   icon.padding_left=5
#   icon.padding_right=10
#   icon.color=$BLACK
#   label.drawing=off
#   script="$PLUGIN_DIR/music.sh"
#   y_offset=-45
# )
#
# music_controls=(
#   background.color=$GREEN
#   background.corner_radius=11
#   background.drawing=on
#   y_offset=-45
# )
#
# sketchybar --add event music_change $MUSIC_EVENT             \
#            --add item music.anchor center                      \
#            --set music.anchor "${music_anchor[@]}"           \
#            --subscribe music.anchor mouse.entered mouse.exited \
#                                       mouse.exited.global        \
#                                                                  \
#            --add item music.cover popup.music.anchor         \
#            --set music.cover "${music_cover[@]}"             \
#                                                                  \
#            --add item music.title popup.music.anchor         \
#            --set music.title "${music_title[@]}"             \
#                                                                  \
#            --add item music.artist popup.music.anchor        \
#            --set music.artist "${music_artist[@]}"           \
#                                                                  \
#            --add item music.album popup.music.anchor         \
#            --set music.album "${music_album[@]}"             \
#                                                                  \
#            --add slider music.state popup.music.anchor       \
#            --set music.state "${music_state[@]}"             \
#            --subscribe music.state mouse.clicked               \
#                                                                  \
#            --add item music.shuffle popup.music.anchor       \
#            --set music.shuffle "${music_shuffle[@]}"         \
#            --subscribe music.shuffle mouse.clicked             \
#                                                                  \
#            --add item music.back popup.music.anchor          \
#            --set music.back "${music_back[@]}"               \
#            --subscribe music.back mouse.clicked                \
#                                                                  \
#            --add item music.play popup.music.anchor          \
#            --set music.play "${music_play[@]}"               \
#            --subscribe music.play mouse.clicked music_change \
#                                                                  \
#            --add item music.next popup.music.anchor          \
#            --set music.next "${music_next[@]}"               \
#            --subscribe music.next mouse.clicked                \
#                                                                  \
#            --add item music.repeat popup.music.anchor        \
#            --set music.repeat "${music_repeat[@]}"           \
#            --subscribe music.repeat  mouse.clicked             \
#                                                                  \
#            --add item music.spacer popup.music.anchor        \
#            --set music.spacer width=5                          \
#                                                                  \
#            --add bracket music.controls music.shuffle        \
#                                           music.back           \
#                                           music.play           \
#                                           music.next           \
#                                           music.repeat         \
#            --set music.controls "${music_controls[@]}"       \
