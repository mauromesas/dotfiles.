#!/bin/bash

CONFIG_DIR="$HOME/.config/waybar"
THEMES_DIR="$CONFIG_DIR/themes"
SCRIPT_NAME="$(basename "$0")"

# Verificar si fzf está instalado
if ! command -v fzf &>/dev/null; then
    echo "fzf no está instalado. Por favor instalalo para continuar."
    exit 1
fi

# Verificar si hay temas disponibles
if [ ! -d "$THEMES_DIR" ] || [ -z "$(ls -A "$THEMES_DIR")" ]; then
    echo "No hay temas disponibles en $THEMES_DIR"
    exit 1
fi

# Seleccionar un tema con fzf
THEME=$(ls "$THEMES_DIR" | fzf --prompt="Elegí un tema: ")

# Cancelación
if [ -z "$THEME" ]; then
    echo "Operación cancelada."
    exit 1
fi

THEME_PATH="$THEMES_DIR/$THEME"

# Confirmar existencia
if [ ! -d "$THEME_PATH" ]; then
    echo "El tema seleccionado no existe."
    exit 1
fi

# Limpiar configuración actual (excepto temas/ y el script)
find "$CONFIG_DIR" -mindepth 1 -maxdepth 1 \
    ! -name "themes" \
    ! -name "$SCRIPT_NAME" \
    -exec rm -rf {} +

# Copiar archivos del tema seleccionado
cp -r "$THEME_PATH/"* "$CONFIG_DIR/"

# Reiniciar Waybar
pkill -x waybar
sleep 0.5
hyprctl dispatch exec "waybar" & disown

echo "Tema aplicado: $THEME"

