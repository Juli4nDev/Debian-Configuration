#!/bin/bash

dir="~/.config/rofi"
# dir="~/.config/polybar/pwidgets/scripts/rofi"
uptime=$(uptime -p | sed -e 's/up //g')

rofi_command="rofi -no-config -theme $dir/powermenu.rasi"

shutdown=" Shutdown"
reboot=" Restart"

confirm_exit() {
    rofi -dmenu -no-config -i -no-fixed-num-lines -p "Are You Sure? : " -theme $dir/confirm.rasi
}

options="$reboot\n$shutdown"

chosen="$(echo -e "$options" | $rofi_command -dmenu -selected-row 0)"
case $chosen in
    $shutdown)
	ans=$(confirm_exit &)
	if [[ $ans == "yes" ]]; then
	    systemctl poweroff
        else
	    exit 0
        fi
        ;;
    $reboot)
	ans=$(confirm_exit &)
	if [[ $ans == "yes" ]]; then
	    systemctl reboot
        else
	    exit 0
        fi
        ;;
esac
