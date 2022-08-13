#!/bin/bash
(
  flock 200

  polybar-msg cmd quit

  while pgrep -u $UID -x polybar > /dev/null; do sleep 0.5; done

  tray_output=eDP1
  outputs=$(polybar --list-monitors | cut -d":" -f1)

  if [[ -z $PRESENTATION ]] ; then
      for m in $outputs; do
        if [[ $m == "DP1" || $m == "DP2" ]] ; then
            tray_output=$m
        fi
      done
  fi

  for m in $outputs; do
    export MONITOR_TOP=$m
    export MONITOR_BOTTOM=$m

    export TRAY_POSITION=none
    if [[ $m == $tray_output ]]; then
      TRAY_POSITION=left
    fi

    polybar --reload "top" </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- & disown
    polybar --reload "bottom" </dev/null >/var/tmp/polybar-$m.log 2>&1 200>&- & disown
  done
) 200>/var/tmp/polybar-launch.lock
