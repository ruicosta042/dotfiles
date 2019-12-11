#!/usr/bin/env bash

mac () {
  brew cask install skype
}

ubuntu () {
  wget https://go.skype.com/skypeforlinux-64.deb
  sudo apt-get install ./skypeforlinux-64.deb -y
  rm skypeforlinux-64.deb
}

os_call "[skype] install?" mac ubuntu
