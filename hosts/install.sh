#!/usr/bin/env bash

mac () {
  setup
}

ubuntu () {
  setup
}

setup () {
  git clone https://github.com/StevenBlack/hosts "hosts/hosts"
  cd "hosts/hosts" || return 1;
  pip3 install --user -r requirements.txt
  python3 updateHostsFile.py --auto --replace --backup --flush-dns-cache --compress
}

os_call "[hosts] install?" mac ubuntu
