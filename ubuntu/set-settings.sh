#!/usr/bin/env bash

# Sets reasonable Ubuntu defaults.
echo "[ubuntu] set-defaults"

# theme
gsettings set org.gnome.desktop.interface gtk-theme 'Adwaita-dark'
gsettings set org.gnome.desktop.interface cursor-theme 'DMZ-Black'
gsettings set org.gnome.desktop.wm.preferences button-layout 'close,minimize,maximize,appmenu:'
gsettings set org.gnome.desktop.interface icon-theme 'ubuntu-mono-dark'
gsettings set org.gnome.desktop.background show-desktop-icons false
gsettings set org.gnome.desktop.interface clock-show-date true
gsettings set org.gnome.desktop.interface show-battery-percentage true
gsettings set org.gnome.desktop.background picture-uri 'file:///usr/share/backgrounds/catalina-wallpaper.jpg'
gsettings set org.gnome.desktop.screensaver picture-uri 'file:///usr/share/backgrounds/catalina-wallpaper.jpg'
gsettings set org.gnome.desktop.interface enable-animations false

# fonts
gsettings set org.gnome.desktop.wm.preferences titlebar-font 'SFNS Display Bold 11'
gsettings set org.gnome.desktop.interface font-name 'SFNS Display 11'
gsettings set org.gnome.desktop.interface document-font-name 'SFNS Display 11'
gsettings set org.gnome.desktop.interface monospace-font-name 'Hack 9'

# dock (dont show it)
gsettings set org.gnome.shell.extensions.dash-to-dock autohide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock intellihide false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false

# sounds
gsettings set org.gnome.desktop.sound event-sounds false

# nautilus
gsettings set org.gnome.nautilus.preferences confirm-trash false

# keyboard layout
# to add more changes to keyboard layout:
# 1. edit `ubuntu/keyboard-macos/.Xmodmap.source` adding changes to the key layout
# 2. apply to the system `xmodmap ubuntu/keyboard-macos/.Xmodmap.source`
# 3. convert to xkbd `xkbcomp $DISPLAY keyboard-macos/.xkbmap.symlink`
# 4. restart
# - if not on a MacOS, comment these lines to disable
xmodmap "ubuntu/keyboard-macos/.Xmodmap.source"
xkbcomp "$DISPLAY" "ubuntu/keyboard-macos/xkbmap.symlink"
mkdir -p "$HOME/.config/autostart"
ln -sf "ubuntu/keyboard-macos/change-keyboard-layout.desktop" "$HOME/.config/autostart/change-keyboard-layout.desktop"
sudo cp "ubuntu/keyboard-macos/60_xkbmap_on_sleep.sh" /lib/systemd/system-sleep
sudo chmod +x /lib/systemd/system-sleep/60_xkbmap_on_sleep.sh

# keybindings
gsettings set org.gnome.desktop.wm.keybindings panel-main-menu "['<Primary>space']"
gsettings set org.gnome.desktop.wm.keybindings switch-applications "['<Primary>Tab']"
gsettings set org.gnome.desktop.wm.keybindings toggle-maximized "['<Primary><Alt>f']"

# TODO: set CAPS-LOCK to HOME https://blog.guilhermegarnier.com/2017/12/increasing-productivity-in-tmux-with-a-single-prefix-key/
