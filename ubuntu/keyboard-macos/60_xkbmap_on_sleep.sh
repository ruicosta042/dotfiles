#!/usr/bin/env bash

case $1/$2 in
  pre/*)
    # Place pre-suspend commands here
    exit 0
    ;;
  post/*)
    # Place post-suspend commands here
    export DISPLAY=":0"
    export XAUTHORITY="/home/ruic/.Xauthority"
    su user -c "xkbcomp /home/ruic/.xkbmap $DISPLAY 2>/dev/null"
    ;;
esac