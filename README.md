# ~/.dotfiles

Environment setup - macOS/Ubuntu.

## Install

#### macOS

```bash
curl -fsSL https://git.io/ruicdot | bash
```

#### Ubuntu

```bash
wget -qO- https://git.io/ruicdot | bash
```

## Software

#### Development

- [x] [git](https://git-scm.com/) - source control
- [x] [nodenv](https://github.com/nodenv/nodenv#nodenv-shell) - `node` version manager
- [x] [vim](https://www.vim.org/) - text editor
- [x] [vscodium](https://github.com/VSCodium/vscodium) - code editor

#### Shell

- [x] [bash-git-prompt](https://github.com/magicmonty/bash-git-prompt) - git info
- [x] [bash](https://www.gnu.org/software/bash/) - shell
- [x] [bat](https://github.com/sharkdp/bat) - `cat` clone with syntax highlightning
- [x] [dust](https://github.com/bootandy/dust) - disk usage
- [x] [fzf](https://github.com/junegunn/fzf) - command-line fuzzy finder
- [x] [ngrok](https://ngrok.com/) - tunnels to localhost
- [x] [python](https://www.python.org/) - `python` interpreter
- [x] [tig](https://github.com/jonas/tig) - text-mode interface for `git`
- [x] [tldr](https://github.com/tldr-pages/tldr) - community-driven man pages
- [x] [z](https://github.com/rupa/z) - jump around directories

#### General use

- [x] [chromium](https://www.chromium.org/) - browser
- [x] [docker](https://www.docker.com/) - containers
- [x] [firefox](https://www.mozilla.org/en-GB/firefox/new/) - browser
- [x] [hosts](https://github.com/StevenBlack/hosts) - hosts file for ad-blocking
- [x] [virtualbox](https://www.virtualbox.org/wiki/Downloads) - virtual environments

#### macOS specific

- [x] [iterm2](https://www.iterm2.com/) - terminal
- [x] [homebrew](https://brew.sh/) - package manager
- [x] [kap](https://getkap.co/) - screen recording
- [x] [maccy](https://maccy.app/) - clipboard manager
- [x] [rectangle](https://github.com/rxhanson/Rectangle) - window management
- [x] [thor](https://github.com/gbammc/Thor) - application switcher
- [ ] [authy](https://authy.com/) - 2FA authenticator app
- [ ] [cleanmymac x](https://macpaw.com/cleanmymac) - system cleaner
- [ ] [sketch](https://www.sketch.com/) - image editor

#### Ubuntu specific

- [x] [gnome tweaks](https://wiki.gnome.org/Apps/Tweaks) - advanced GNOME 3 settings
- [x] [terminator](https://terminator-gtk3.readthedocs.io/en/latest/) - terminal

#### Missing automatic configs (macOS/ubuntu)

- [ ] [firefox] Don't offer to save passwords
- [ ] [firefox] Don't offer to save addresses
- [ ] [firefox] Set to compact density
- [ ] [firefox] Set theme to dark

## macOS

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
- [ ] [iterm2] set theme to minimal
- [ ] set <kbd>CAPS-LOCK</kbd> to <kbd>CTRL</kbd>
- [ ] set Spotlight shortcut to <kbd>CMD</kbd> + <kbd>SPACE</kbd>

## Ubuntu

- [x] Adwaita-dark
- [x] San Francisco Display as system font
- [x] Hack as monospace font
- [x] don't display dock
- [x] apply keyboard changes on install
- [x] apply keyboard changes on restart/login
- [x] apply keyboard changes on hibernate/sleep
- [x] swap <kbd>CTRL-L</kbd> with <kbd>CMD-L</kbd>
- [x] set <kbd>CAPSLOCK</kbd> to <kbd>CTRL</kbd>
- [x] show overview: <kbd>CMD-L</kbd> + <kbd>SPACE</kbd>
- [x] toggle maximized state: <kbd>CMD-L</kbd> + <kbd>ALT-L</kbd> + <kbd>f</kbd>
- [x] switch applications: <kbd>CMD-L</kbd> + <kbd>TAB</kbd>
- [ ] Auto-hide top bar
- [ ] remove Overview Shortcut from <kbd>CMD-L</kbd> (on GnomeTweaks)

## License

MIT
