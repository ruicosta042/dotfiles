#!/usr/bin/env bash

mac () {
  brew install rambox
  
  cp rambox/config.json ~/Library/Application\ Support/Rambox/config.json 
}

os_call "[rambox] install?" mac
