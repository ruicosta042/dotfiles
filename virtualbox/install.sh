#!/usr/bin/env bash

mac () {
  brew cask install virtualbox
  brew cask install virtualbox-extension-pack
  setup
}

setup () {
  # no host key combination
  VBoxManage setextradata global GUI/Input/HostKeyCombination 0
  # double the guest screen for a mac's retina display
  VBoxManage setextradata global GUI/ScaleFactor "$(os_value 2 1)"
}

os_call "[virtualbox] install?" mac
