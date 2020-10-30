#!/usr/bin/env bash

mac () {
  brew install nb

  setup
}

ubuntu () {
  sudo apt-get install nb -y

  setup
}

setup () {
  (
    cd "$HOME_DIR/.nb/home" || exit
    git remote add origin git@github.com:ruicosta042/nb.git
    git branch -M main
    nb sync
  )
}

os_call "[nb] install?" mac ubuntu
