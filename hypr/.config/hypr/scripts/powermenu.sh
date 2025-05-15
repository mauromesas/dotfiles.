#!/bin/bash

rofi_cmd="rofi -theme ~/.config/rofi/power.rasi"

# Opciones del menú
shutdown="  Shutdown"
reboot="  Reboot"
lock="  Lock"
suspend="  Suspend"
logout="  Logout"

# Mostrar el menú
chosen=$(echo -e "$lock\n$suspend\n$logout\n$reboot\n$shutdown" | $rofi_cmd -dmenu -p "[^.^]")

case $chosen in
    $shutdown)
        systemctl poweroff
        ;;
    $reboot)
        systemctl reboot
        ;;
    $lock)
        hyprlock
        ;;
    $suspend)
        systemctl suspend
        ;;
    $logout)
        hyprctl dispatch exit || pkill -KILL -u $USER
        ;;
esac

