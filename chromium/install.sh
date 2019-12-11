#!/usr/bin/env bash

mac () {
  brew cask install chromium
}

ubuntu () {
  sudo apt-get install chromium-browser -y
}

os_call "[chromium] install?" mac ubuntu
