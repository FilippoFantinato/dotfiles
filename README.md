# Dotfiles

Personal dotfiles and scripts managed with GNU stow.

## Sway

- foot terminal
- rofi
- sway
- swaylock
- swaync
- waybar
- wlogout

## Other

- bash
- VS Code
- git
- neovim
- sublime text
- zathura
- zsh

## Gnome shell

Dump dconf settings:

```bash
dconf dump / > dconf-settings.ini
```

Restore dconf settings:

```bash
dconf load / < dconf-settings
```

Dump gnome extensions:

```bash
gnome-extensions list > gnome-extensions.txt
```

Install gnome extensions:

```bash
./install-gnome-extensions
```

## VS Code

Dump VS Code extensions:

```bash
code --list-extensions > vscode-extensions.txt
```

Install VS Code extensions:

```bash
./install-vscode-extensions
```
