#!/usr/bin/env bash

# System specific
if test "$(uname)" = "Darwin" ; then
  bash ./system/macos.sh
elif test "$(lsb_release -is)" = "Ubuntu" ; then
  bash ./system/ubuntu.sh
else
  echo "Operative system not supported."
  exit 1
fi

# Homebrew
brew update
brew tap Homebrew/bundle
brew bundle --verbose
brew upgrade

# Applications
for installer in $(find . -maxdepth 2 -name _install.sh | sort -n) ; do
  source "$installer"
done

# Configuration files
stow vim -t "$HOME"