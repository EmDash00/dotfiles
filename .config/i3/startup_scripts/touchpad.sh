#!/bin/sh

id=$(xinput list | grep "Touchpad" | sed "s/.\+id=\([[:digit:]]\+\).\+/\1/")
prop=$(xinput --list-props SYNA2B31:00\ 06CB:CD3E\ Touchpad | grep "Accel Speed ("  | sed "s/[[:space:]]\+libinput Accel Speed (\([[:digit:]]\+\)).\+/\1/")

xinput -set-prop $id $prop 0.35
