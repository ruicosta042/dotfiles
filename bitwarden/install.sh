#!/usr/bin/env bash

mac () {
  brew install bitwarden
}

ubuntu () {
  snap install ngbitwardenrok
}

os_call "[bitwarden] install?" mac ubuntu
