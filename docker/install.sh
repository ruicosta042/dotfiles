#!/usr/bin/env bash

mac () {
  brew install docker
  brew install docker-compose
}

os_call "[docker] install?" mac
