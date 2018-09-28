# dotfiles

> Because life's too short to manually setup my machine

# high level steps

1. Install/Boot new machine, run through mac setup
2. run `git --version`. This will trigger a prompt to install xcode command line tools
3. Install/agree to xcode command line tools
4. git clone this repo
5. run ./setup.sh:

- ask for sudo
- create directories - dev, and dev/work (instead of IBM?)
- symlink dotfiles
- gitconfig for ibm
- install node/nvm
- homebrew
  - install packages
    - brew git
    - brew install yarn --without-node
    - mas to install apps from mac app store
  - brew cask - applications
    - vscode
    - vscode cli
    - vscode extensions/settings sync
    - dropbox - log into dropbox, to begin sync 1password down
    - slack
    - spotify
    - vlc
    - sketch
    - iterm2
    - hyper terminal
    - postman
- mas applications from the mac app store
  - 1password
  - lungo
- reload/source dotfiles/bash
- ?? reorder/delete apps from dock
- ?? screen management, not divvy?
- ?? install dank mono font - from dropbox?
- restart computer

## Acknowledgements

Inspiration and code was taken from many sources, including:

@mathiasbynens (Mathias Bynens) https://github.com/mathiasbynens/dotfiles
@paulirish (Paul Irish) https://github.com/paulirish/dotfiles
@alrra (Cãtãlin Mariş) https://github.com/alrra/dotfiles
