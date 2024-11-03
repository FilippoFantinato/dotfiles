# Dotfiles

Personal dotfiles and scripts managed with GNU stow.

- foot terminal
- neovim
- rofi
- sway
- swaylock
- swaync
- waybar
- zathura
- zsh

## Configuration files

Dump dconf settings:

```
$ dconf dump / > dconf-settings.ini
```

Restore dconf settings:

```
$ dconf load / < dconf-settings
```

## Extensions

### Gnome shell

Dump gnome extensions:

```
$ gnome-extensions list > gnome-extensions.txt
```

Install gnome extensions:

```
$ ./install-gnome-extensions
```

### VS Code

Dump VS Code extensions:

```
$ code --list-extensions > vscode-extensions.txt
```

Install VS Code extensions:

```
$ ./install-vscode-extensions
```
