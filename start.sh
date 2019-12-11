#!/usr/bin/env bash

source "./_lib/os.sh"

install_system_packages () {
  echo "[dotfiles] install system packages"
  source "./$(os_name)/system.sh"
}

pre_install_applications () {
  echo "[dotfiles] pre-install applications"
  for installer in $(find . -maxdepth 2 -name pre-install.sh | sort -n) ; do
    source "$installer"
  done
}

install_applications () {
  echo "[dotfiles] install applications"
  for installer in $(find . -maxdepth 2 -name install.sh | sort -n) ; do
    source "$installer"
  done
}

apply_system_settings () {
  echo "[dotfiles] apply system settings"
  source "./$(os_name)/set-settings.sh"
}

symlinks () {
  echo "[dotfiles] create symlinks"
  for source in $(find "$DOTFILES_DIR" -type f | sort -n) ; do
    target=$HOME/.$(basename "$source")
    ln -sf "$source" "$target"
  done
}

export DOTFILES_DIR=~/.dotfiles
mkdir "$DOTFILES_DIR"

install_system_packages
pre_install_applications
install_applications
apply_system_settings
symlinks
