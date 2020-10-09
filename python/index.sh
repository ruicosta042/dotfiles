#!/usr/bin/env bash

mac() {
  brew install python
  pip install --user pipenv
}

os_call "[python] install?" mac 
