#!/usr/bin/env bash

polybar "top" 2>&1 | tee -a "/tmp/top.log" & disown
polybar bottom 2>&1 | tee -a "/tmp/bottom.log" & disown
