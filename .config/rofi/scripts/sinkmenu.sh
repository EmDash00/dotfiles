#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="~/.config/rofi/themes"

rofi_command="rofi -dpi 200 -theme $dir/powermenu.rasi"

options=$(pactl list sinks | grep Description | sed 's/[[:space:]]\+Description: //')
sinks=$(pactl list short sinks | sed 's/[[:digit:]][[:space:]]\+//' | sed 's/[[:space:]]\+/ /g' | cut -d ' ' -f1)

# Find default sink
default_sink=$(pactl info | grep "Default Sink" | sed "s/Default Sink: //")

LINENUM=1
for sink in $sinks
do
  if [[ "$sink" == $default_sink ]]; then
    break
  fi
  LINENUM=$((LINENUM + 1))
done

options=$(echo "$options" | sed "${LINENUM}d")
sinks=$(echo "$sinks" | sed "${LINENUM}d")

chosen="$(echo -e "$options" | $rofi_command -p "Set default sink:" -dmenu -i -selected-row 0)"
LINENUM=1

if [[ $chosen != "" ]]; then
  for option in "$options"
  do
    echo "$option"
    if [[ "$option" == "$chosen" ]]; then
      break
    fi
    LINENUM=$((LINENUM + 1))
  done

  chosen_sink=$(echo "$sinks" | sed -n "${LINENUM}p")
  echo $chosen_sink
  pactl set-default-sink "$chosen_sink"

  polybar-msg cmd restart > /dev/null 2>&1 & disown
fi
