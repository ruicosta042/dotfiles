#!/usr/bin/env bash

source ./lib/helpers.sh

# System specific
if [[ $(os_name) == "macos" ]] ; then
  source system/macos.sh
elif [[ $(os_name) == "ubuntu" ]] ; then
  source system/ubuntu.sh
else
  echo "OS not supported."
  exit 1
fi


# Homebrew
brew update
brew tap Homebrew/bundle
brew bundle --verbose
if [[ $(os_name) == "macos" ]] ; then
  brew bundle --file Brewfile-mac
elif [[ $(os_name) == "ubuntu" ]] ; then
  brew bundle --file Brewfile-ubuntu
fi
brew upgrade --greedy


# Apps configuration
source 'config/config.sh'

if [[ $(os_name) == "macos" ]] ; then
  stow macos -t "$HOME"
elif [[ $(os_name) == "ubuntu" ]] ; then
  stow ubuntu -t "$HOME"
fi
