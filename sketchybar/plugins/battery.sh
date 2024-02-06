#!/bin/bash

source "$CONFIG_DIR/icons.sh"
source "$CONFIG_DIR/colors.sh"

BATTERY_INFO="$(pmset -g batt)"
PERCENTAGE=$(echo "$BATTERY_INFO" | grep -Eo "\d+%" | cut -d% -f1)
CHARGING=$(echo "$BATTERY_INFO" | grep 'AC Power')

if [ $PERCENTAGE = "" ]; then
  exit 0
fi

DRAWING=on
COLOR=$WHITE
case ${PERCENTAGE} in
    100) ICON="" COLOR="$GREEN" ;;
    9[0-9]) ICON="" COLOR="$GREEN" ;;
    8[0-9]) ICON="" COLOR="$GREEN" ;;
    7[0-9]) ICON="" COLOR="$GREEN" ;;
    6[0-9]) ICON="" COLOR="$YELLOW" ;;
    5[0-9]) ICON="" COLOR="$YELLOW" ;;
    4[0-9]) ICON="" COLOR="$ORANGE" ;;
    3[0-9]) ICON="" COLOR="$ORANGE" ;;
    2[0-9]) ICON="" COLOR="$RED" ;;
    1[0-9]) ICON="" COLOR="$RED" ;;
    *) ICON=""  COLOR="$RED" ;;
esac

if [[ $CHARGING != "" ]]; then
  ICON=$BATTERY_CHARGING
  DRAWING=off
fi

sketchybar --set $NAME drawing=$DRAWING icon="$ICON" icon.color=$COLOR
