#!/usr/bin/env bash

mac () {
  brew cask install chromium

  # so that the firewall doesn't ask to block incoming connections
  codesign --force --deep --sign - /Applications/Chromium.app/Contents/MacOS/Chromium
}

ubuntu () {
  sudo apt-get install chromium-browser -y
}

os_call "[chromium] install?" mac ubuntu
