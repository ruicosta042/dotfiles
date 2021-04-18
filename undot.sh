#!/usr/bin/env bash

source ./lib/helpers.sh


# uninstall apps, remove config files
if [[ $(os_name) == "macos" ]] ; then
  brew bundle cleanup --force Brewfile-mac
  stow -D macos
elif [[ $(os_name) == "ubuntu" ]] ; then
  brew bundle cleanup --force Brewfile-ubuntu
  stow -D ubuntu
fi

rm -rf "$HOME"/.ssh
