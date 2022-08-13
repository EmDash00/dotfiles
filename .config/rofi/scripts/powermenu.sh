#!/usr/bin/env bash

## Author  : Aditya Shakya
## Mail    : adi1090x@gmail.com
## Github  : @adi1090x
## Twitter : @adi1090x

dir="~/.config/rofi/themes"
uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -theme $dir/powermenu.rasi"

# Options
shutdown=" Shutdown"
reboot="勒 Restart"
lock=" Lock"
suspend="⏾ Sleep"
logout=" Logout"
hibernate=" Hibernate"

# Variable passed to rofi
options="$shutdown\n$reboot\n$hibernate\n$suspend\n$lock\n$logout"

chosen="$(echo -e "$options" | $rofi_command -p "Uptime: $uptime" -dmenu -i -selected-row 0)"
case $chosen in
    $shutdown)
			shutdown now ;;
    $reboot)
			reboot ;;
    $lock)
			i3lock-fancy ;;
    $suspend)
			i3lock-fancy && systemctl suspend ;;
    $logout)
				i3-msg exit ;;
	  $hibernate)
			i3lock-fancy && systemctl hibernate ;;
esac
