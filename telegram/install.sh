#!/usr/bin/env bash

mac () {
  brew cask install telegram
}

ubuntu () {
  sudo add-apt-repository ppa:atareao/telegram -y
  sudo apt-get update -y
  sudo apt install telegram -y
}

os_call "[telegram] install?" mac ubuntu
