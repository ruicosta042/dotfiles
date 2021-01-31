#!/usr/bin/env bash

mac () {
  brew install firefox
}

ubuntu () {
  sudo apt-get install firefox -y
}

os_call "[firefox] install?" mac ubuntu
