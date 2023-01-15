#!/bin/bash

LOW_FLAG=0
CRITICAL_FLAG=0
SLEEPYTIMEZ=6000
while [ true ] ; do
  battery_level=$(acpi | sed "s/.\+\([[:digit:]]\{2\}\).\+/\1/")
  battery_status=$(acpi | sed "s/.\+: \([[:alpha:]]\+\).\+/\1/")
  remaining=$(acpi | sed "s/.\+\([[:digit:]]\{2\}:[[:digit:]]\{2\}:[[:digit:]]\{2\}\).\+/\1/")

  if [[ $LOW_FLAG -eq 0 ]] ; then
    if [[ $battery_level -le 25 ]] && [[ "$battery_status" == "Discharging" ]] ; then
      notify-send -u critical -i /usr/share/icons/Papirus-Dark/symbolic/status/battery-low-symbolic.svg \
        "Low Battery" "$remaining remaining"
      LOW_FLAG=1
      SLEEPYTIMEZ=60
    fi
  else
    if [[ $battery_level -ge 25 ]] ; then
      LOW_FLAG=0
      SLEEPYTIMEZ=6000
    fi

    if [[ $CRITICAL_FLAG -eq 0 ]] ; then
      if [[ $battery_level -le 15 ]] && [[ "$battery_status" == "Discharging" ]] ; then
        notify-send -u critical -i /usr/share/icons/Papirus-Dark/symbolic/status/battery-empty-symbolic.svg \
          "Critical Battery Level" "$remaining remaining"
        break
      fi
    else
      if [[ $battery_level -ge 15 ]] ; then
        CRITICAL_FLAG=0
      elif [[ $battery_level -le 7 ]] ; then
        i3lock-fancy && systemctl hibernate
      fi
    fi
  fi

  sleep $SLEEPYTIMEZ
done

