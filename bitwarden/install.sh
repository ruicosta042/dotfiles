#!/usr/bin/env bash

mac () {
  brew cask install bitwarden
}

ubuntu () {
  snap install ngbitwardenrok
}

os_call "[bitwarden] install?" mac ubuntu
