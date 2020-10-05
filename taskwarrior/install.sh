#!/usr/bin/env bash

mac () {
  brew install task
  setup
}

ubuntu () {
  sudo apt-get install taskwarrior -y
  setup
}

setup () {
  mkdir "$HOME/.task"
  cp taskwarrior/_nord.theme "$HOME/.task/nord.theme"
}

os_call "[taskwarrior] install?" mac ubuntu
