#!/usr/bin/env bash

mac () {
  brew install vim
}

ubuntu () {
  sudo apt-get install vim -y
}

os_call "[vim] install?" mac ubuntu
