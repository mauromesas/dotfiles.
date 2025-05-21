<h2 align="center">[Linux Dotfiles]</h2>

### Install with stow:
```bash
stow .
```
### Setup

<table>
  <tr>
    <td>OS</td>
    <td>Arch Linux</td>
  </tr>
  <tr>
    <td>Window Manager</td>
    <td>Hyprland</td>
  </tr>
  <tr>
    <td>Terminal</td>
    <td>Kitty</td>
  </tr>
  <tr>
    <td>File Manager</td>
    <td>Nemo</td>
  </tr>
  <tr>
    <td>Launcher</td>
    <td>Wofi - Rofi</td>
  </tr>
  <tr>
    <td>Editor</td>
    <td>Neovim</td>
  </tr>
  
</table>


> [!IMPORTANT]
> Arch packages.
> ```bash
> sudo pacman -S git kitty nemo wofi rofi waybar neovim zsh tmux bat eza fzf yazi btop stow
> ```
> Aur packages.
> ```bash
> yay -S zen-browser-bin waypaper nwg-look visual-studio-code-bin
> ```

> [!TIP]
> Install yay-aur helper.
> ```bash
> git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
> ```
