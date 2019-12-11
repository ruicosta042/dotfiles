#!/usr/bin/env bash

mac () {
  brew cask uninstall iterm2
  defaults delete com.googlecode.iterm2
  rm -rf ~/Library/Application\ Support/iTerm2
}

os_call "[iterm2] uninstall?" mac
