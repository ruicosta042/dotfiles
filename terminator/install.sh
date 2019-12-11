#!/usr/bin/env bash

ubuntu () {
  sudo apt install terminator -y
  mkdir "$HOME/.config/terminator"
  cp terminator/_config "$DOTFILES_DIR/terminator-config"
  ln -sf "$DOTFILES_DIR/terminator-config" "$HOME/.config/terminator/config"
}

os_call "[terminator] install?" 0 ubuntu

