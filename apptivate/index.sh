#!/usr/bin/env bash

mac () {
  brew install apptivate
  cp apptivate/_hotkeys ~/Library/Application\ Support/Apptivate
}

os_call "[apptivate] install?" mac
