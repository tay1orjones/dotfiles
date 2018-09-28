#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Installs\n\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Homebrew Packages\n"
brew_install "Git" "git"
brew_install "Yarn" "yarn" "" "" "--without-node"
brew_install "Mac App Store command line interface" "mas"

print_in_purple "\n   Homebrew Applications\n"
brew_install "Dropbox" "dropbox" "caskroom/cask" "cask"
brew_install "Chrome" "google-chrome" "caskroom/cask" "cask"
brew_install "Slack" "slack" "caskroom/cask" "cask"
brew_install "Visual Studio Code" "visual-studio-code" "caskroom/cask" "cask"
brew_install "iTerm2" "iterm2" "caskroom/cask" "cask"
brew_install "Hyper" "hyper" "caskroom/cask" "cask"
brew_install "Spotify" "spotify" "caskroom/cask" "cask"
brew_install "Sketch" "sketch" "caskroom/cask" "cask"
brew_install "Postman" "postman" "caskroom/cask" "cask"
brew_install "Firefox" "firefox" "caskroom/cask" "cask"
brew_install "VLC" "vlc" "caskroom/cask" "cask"
brew_install "iStat Menus" "istat-menus" "caskroom/cask" "cask"

print_in_purple "\n   Mac App Store Applications\n"
mas '1Password', id: 568903335
mas 'Lungo', id: 1263070803

print_in_purple "\n   Cleanup\n\n"
brew_cleanup