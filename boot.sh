#!/usr/bin/env bash

{ # this ensures the entire script is downloaded #
  os_has () {
    type "${1-}" >/dev/null 2>&1
  }

  download () {
    (>&2 echo "[dotfiles] downloading")
    tmp_zip="$(mktemp 2>/dev/null).zip"
    if os_has "curl" ; then
      curl -fsSL "$1" > "$tmp_zip"
    elif os_has "wget" ; then
      wget -qO - "$1" > "$tmp_zip"
    else
      echo "ERROR: curl or wget needs to be available"
      exit 1
    fi
    echo "$tmp_zip"
  }

  extract_github_zipfile () {
    (>&2 echo "[dotfiles] extracting")
    tmp_dir=$(dirname "$1")
    tmp_basename=$(basename "$1")
    tmp_filename=${tmp_basename%.zip}
    unzip "$1" -d "$tmp_dir" 1>/dev/null
    tmp_dotfiles="$tmp_dir/$tmp_filename"
    if test -f "$tmp_dotfiles"; then
      rm -rf "$tmp_dotfiles"
    fi
    mv "${tmp_dir}/dotfiles-master" "$tmp_dotfiles"
    rm "$1" 
    echo "$tmp_dotfiles"
  }

  downloaded_zip=$(download https://github.com/ruicosta042/dotfiles/archive/master.zip) 
  BOOTSTRAP_DIR=$(extract_github_zipfile "$downloaded_zip")

  (cd "$BOOTSTRAP_DIR" && bash "$BOOTSTRAP_DIR/start.sh")
}
