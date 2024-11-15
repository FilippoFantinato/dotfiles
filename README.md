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

## Dependencies

- [Oh My zsh](https://github.com/ohmyzsh/ohmyzsh)
- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

```bash
dnf install sway-config-fedora      \
            swaync wlogout wlsunset \
            zsh tmux
```

## Fonts

- Fira Code (Nerd Font)
- Cascadia Mono Nerd Font
- [MesloLGS Nerd Font (zsh version)](https://github.com/romkatv/powerlevel10k/blob/master/font.md)

```bash
dnf install cascadia-mono-nf-fonts fira-code-fonts
```
