#!/bin/bash

LOW_FLAG=0
CRITICAL_FLAG=0
SLEEPYTIMEZ=6000

battery_level=$(acpi | sed "s/.\+\([[:digit:]]\{2\}\)%.\+/\1/")
battery_status=$(acpi | sed "s/.\+: \([[:alpha:]]\+\).\+/\1/")

if [[ "$battery_status" == "Discharging" ]] ; then
    if [[ $battery_level -lt 25 ]] ; then
      LOW_FLAG=1
      sleep 60
      remaining=$(acpi | sed "s/.\+\([[:digit:]]\{2\}:[[:digit:]]\{2\}:[[:digit:]]\{2\}\).\+/\1/")
      notify-send -u normal -i /usr/share/icons/Papirus-Dark/symbolic/status/battery-low-symbolic.svg \
        "Low Battery" "$remaining remaining"
    elif [[ $battery_level -lt 15 ]] ; then
      LOW_FLAG=1
      CRITICAL_FLAG=1
      sleep 60
      remaining=$(acpi | sed "s/.\+\([[:digit:]]\{2\}:[[:digit:]]\{2\}:[[:digit:]]\{2\}\).\+/\1/")
      notify-send -u critical -i /usr/share/icons/Papirus-Dark/symbolic/status/battery-empty-symbolic.svg \
        "Critical Battery Level" "$remaining remaining"
    fi
fi

while [ true ] ; do
  battery_level=$(acpi | sed "s/.\+\([[:digit:]]\{2\}\)%.\+/\1/")
  battery_status=$(acpi | sed "s/.\+: \([[:alpha:]]\+\).\+/\1/")
  echo "$battery_level"

  if [[ $LOW_FLAG -eq 0 ]] ; then
    if [[ $battery_level -lt 25 ]] && [[ "$battery_status" == "Discharging" ]] ; then
      remaining=$(acpi | sed "s/.\+\([[:digit:]]\{2\}:[[:digit:]]\{2\}:[[:digit:]]\{2\}\).\+/\1/")
      notify-send -u normal -i /usr/share/icons/Papirus-Dark/symbolic/status/battery-low-symbolic.svg \
        "Low Battery" "$remaining remaining"
      LOW_FLAG=1
      SLEEPYTIMEZ=600
    fi
  else
    if [[ $battery_level -ge 25 ]] ; then
      LOW_FLAG=0
      SLEEPYTIMEZ=6000
    fi

    if [[ $CRITICAL_FLAG -eq 0 ]] ; then
      if [[ $battery_level -lt 15 ]] && [[ "$battery_status" == "Discharging" ]] ; then
        CRITICAL_FLAG=1
        remaining=$(acpi | sed "s/.\+\([[:digit:]]\{2\}:[[:digit:]]\{2\}:[[:digit:]]\{2\}\).\+/\1/")
        notify-send -u critical -i /usr/share/icons/Papirus-Dark/symbolic/status/battery-empty-symbolic.svg \
          "Critical Battery Level" "$remaining remaining"
      fi
    else
      if [[ $battery_level -ge 15 ]] ; then
        CRITICAL_FLAG=0
      elif [[ $battery_level -le 7 ]] ; then
        if [[ $battery_status == "Discharging" ]] ; then
          notify-send -u critical -i /usr/share/icons/Papirus-Dark/symbolic/status/battery-empty-symbolic.svg \
            "Critical Battery Level" "Hibernating in 60 seconds to prevent loss of data. Plug in now to prevent hibernation."
          sleep 60

          battery_status=$(acpi | sed "s/.\+: \([[:alpha:]]\+\).\+/\1/")

          if [[ $battery_status == "Discharging" ]] ; then
            i3lock-fancy && systemctl hibernate
          fi
        fi
      fi
    fi
  fi

  sleep $SLEEPYTIMEZ
done

