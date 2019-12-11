#!/usr/bin/env bash

mac () {
  brew cask install firefox
  brew cask install homebrew/cask-versions/firefox-developer-edition
}

ubuntu () {
  sudo apt-get install firefox -y
}

os_call "[firefox] install?" mac ubuntu
