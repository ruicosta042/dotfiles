#!/usr/bin/env bash

mac () {
  brew install ngrok
}

ubuntu () {
  snap install ngrok
}

os_call "[ngrok] install?" mac ubuntu
