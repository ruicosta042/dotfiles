# ~/.dotfiles

Environment setup - macOS/Ubuntu.

## Install

#### macOS

```
curl -fsSL https://git.io/ruicdot | bash
```

#### Ubuntu

```
wget -qO- https://git.io/ruicdot | bash
```

## Software

#### Development

- [x] [vscodium](https://github.com/VSCodium/vscodium) - code editor
- [x] [git](https://git-scm.com/) - source control
- [x] [vim](https://www.vim.org/) - text editor
- [x] [nodenv](https://github.com/nodenv/nodenv#nodenv-shell) - `node` version manager
- [x] [tig](https://github.com/jonas/tig) - text-mode interface for `git`
- [x] [dash](https://kapeli.com/dash) - documentation browser
- [x] [docker](https://www.docker.com/) - containers

#### CLI

- [x] [bash](https://www.gnu.org/software/bash/) - shell
- [x] [bat](https://github.com/sharkdp/bat) - `cat` clone with syntax highlightning
- [x] [dust](https://github.com/bootandy/dust) - disk usage
- [x] [fzf](https://github.com/junegunn/fzf) - command-line fuzzy finder
- [x] [homebrew](https://brew.sh/) - package manager
- [x] [python](https://www.python.org/) - `python` interpreter

#### General use

- [x] [chromium](https://www.chromium.org/) - browser
- [x] [firefox](https://www.mozilla.org/en-GB/firefox/new/) - browser
- [x] [hosts](https://github.com/StevenBlack/hosts) - hosts file for ad-blocking
- [x] [virtualbox](https://www.virtualbox.org/wiki/Downloads) - virtual environments

#### macOS specific

- [ ] [authy](https://authy.com/) - 2FA authenticator app
- [ ] [cleanmymac x](https://macpaw.com/cleanmymac) - system cleaner
- [ ] [sketch](https://www.sketch.com/) - image editor
- [x] [gifox](https://gifox.io/) - screen recorder
- [x] [iterm2](https://www.iterm2.com/) - terminal
- [x] [maccy](https://maccy.app/) - clipboard manager
- [x] [rectangle](https://github.com/rxhanson/Rectangle) - window management

#### Ubuntu specific

- [x] [gnome tweaks](https://wiki.gnome.org/Apps/Tweaks) - advanced GNOME 3 settings
- [x] [terminator](https://terminator-gtk3.readthedocs.io/en/latest/) - terminal

#### Apply settings to:

- [x] bash
- [x] git
- [x] iterm2
- [x] maccy
- [x] terminator
- [x] tig
- [x] vim
- [x] virtualbox
- [x] vscodium

#### Missing automatic configs (macOS/ubuntu)

- [ ] [firefox] Don't offer to save passwords
- [ ] [firefox] Don't offer to save addresses
- [ ] [firefox] Set to compact density
- [ ] [firefox] Set theme to dark

## macOS

- [ ] [iterm2] set theme to minimal
- [ ] set CAPS-LOCK to CTRL
- [ ] set Spotlight shortcut to CMD+SPACE
- [ ] set Spectacle to start on login
- [x] set to Dark Mode
- [x] minimal dock
- [x] auto-hide top bar
- [x] expand save panel by default
- [x] disable the “Are you sure you want to open this application?” dialog
- [x] finder: show hidden files by default
- [x] finder: show all filename extensions
- [x] don’t automatically rearrange Spaces based on most recent use
- [x] wipe all (default) app icons from the Dock
- [x] remove the auto-hiding Dock delay
- [x] set fast keyboard repeat rate
- [x] set trackpad scroll direction to natural

## Ubuntu

- [ ] Auto-hide top bar
- [ ] remove Overview Shortcut from CMD_L (on GnomeTweaks)
- [x] Adwaita-dark
- [x] San Francisco Display as system font
- [x] Hack as monospace font
- [x] don't display dock
- [x] apply keyboard changes on install
- [x] apply keyboard changes on restart/login
- [x] apply keyboard changes on hibernate/sleep
- [x] swap CTRL_L with CMD_L
- [x] set CAPSLOCK to CTRL
- [x] show overview: CMD_L + SPACE
- [x] toggle maximized state: CMD_L + ALT_L + f
- [x] switch applications: CMD_L + TAB

## License

MIT
