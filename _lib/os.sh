#!/usr/bin/env bash

os_name () {
  if test "$(uname)" = "Darwin" ; then
    echo "macos"
  elif test "$(lsb_release -is)" = "Ubuntu" ; then
    echo "ubuntu"
  else
    echo "Operative system not supported."
    exit 1
  fi
}

os_value () {
  if [[ $(os_name) == "macos" ]] ; then
    echo "$1"
  elif [[ $(os_name) == "ubuntu" ]] ; then
    echo "$2"
  fi
}

prompt_yes_no () {
  read -r -p "$1 [yN]: " reply < /dev/tty
  if [[ "$reply" =~ ^[Yy]$ ]] ; then
    return 0
  fi
  return 1
}

has_os_function () {
  if [[ $(os_name) == "macos" && $1 != mac ]] ; then
    return 1
  fi
  if [[ $(os_name) == "ubuntu" && $2 != ubuntu ]] ; then
    return 1
  fi 
  return 0
}

os_call () {
  has_os_function "$2" "$3"
  if [[ $? -eq 1 ]] ; then
    return 1
  fi

  prompt_yes_no "$1"
  if [[ $? -eq 1 ]] ; then
    return 1
  fi

  if [[ $(os_name) == "macos" ]] ; then
    $2
  elif [[ $(os_name) == "ubuntu" ]] ; then
    $3
  fi
}
