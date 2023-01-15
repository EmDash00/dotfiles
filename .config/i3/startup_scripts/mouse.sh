#!/bin/sh

bluetoothctl connect E1:C0:83:88:9B:87

if [ $? -eq '0' ] ; then
  id=$(xinput list | grep "MX Ergo Mouse" | sed "s/.\+id=\([[:digit:]]\+\).\+/\1/")
  prop=$(xinput --list-props "MX Ergo Mouse" | grep "Accel Speed ("  | sed "s/[[:space:]]\+libinput Accel Speed (\([[:digit:]]\+\)).\+/\1/")

  echo $id
  echo $prop

  xinput -set-prop $id $prop 1
fi
