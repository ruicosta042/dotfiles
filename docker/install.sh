#!/usr/bin/env bash

mac () {
  brew cask install docker
  brew cask install kitematic
}

os_call "[docker] install?" mac
