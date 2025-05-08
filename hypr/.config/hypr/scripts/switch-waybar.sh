#!/bin/bash

CONFIG_DIR="$HOME/.config/waybar"
TARGET="$1"

if [ -z "$TARGET" ]; then
  echo "Uso: $0 [minimal|oxocarbon|catppuccin]"
  exit 1
fi

THEME_PATH="$CONFIG_DIR/themes/$TARGET"

# Verificar si el tema existe
if [ ! -d "$THEME_PATH" ]; then
  echo "El tema '$TARGET' no existe en $CONFIG_DIR/themes/"
  exit 1
fi

# Limpiar configuración actual (excepto la carpeta de temas y este script)
find "$CONFIG_DIR" -mindepth 1 -maxdepth 1 ! -name "themes" ! -name "$(basename "$0")" -exec rm -rf {} +

# Copiar archivos y carpetas del tema
cp -r "$THEME_PATH/"* "$CONFIG_DIR/"

# Reiniciar Waybar
pkill -x waybar
sleep 0.5
hyprctl dispatch exec "waybar" & disown

echo "Waybar cambiado a '$TARGET'"

