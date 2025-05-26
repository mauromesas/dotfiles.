#!/bin/bash

# Opciones del menú
options="⏻ Apagar\n Reiniciar\n Suspender\n Cerrar sesión"

# Mostrar menú con Wofi
choice=$(echo -e "$options" | wofi --dmenu --prompt="¿Qué querés hacer?" --style="$HOME/.config/wofi/power.css")

case "$choice" in
    *Apagar*) systemctl poweroff ;;
    *Reiniciar*) systemctl reboot ;;
    *Suspender*) systemctl suspend ;;
    *Cerrar\ sesión*) hyprctl dispatch exit ;;
    *) exit 1 ;;
esac

