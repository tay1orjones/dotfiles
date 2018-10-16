# dotfiles

> Because life's too short to manually setup my machine

# get started

1. Install/Boot new machine, run through mac setup
2. run `git --version`. This will trigger a prompt to install xcode command line tools
3. Install/agree to xcode command line tools
4. Create dev directory and clone this repo:

```bash
mkdir dev && cd dev && git clone https://github.com/tay1orjones/dotfiles.git && cd dotfiles
```

5. Replace links to private fonts in [./setup.sh](/setup.sh) with live URLs from dropbox.com
6. Run from home directory:

```bash
 sh setup.sh
```

## post set up

1. Configure night shift (I've not found a way to automatically configure)
2. Add Dropbox folder to dock (best to do this once logged into dropbox and it's began syncing)

       defaults write com.apple.dock persistent-others -array-add '<dict><key>tile-data</key><dict><key>arrangement</key><integer>1</integer><key>displayas</key><integer>1</integer><key>file-label</key><string>Dropbox</string><key>file-type</key><integer>2</integer><key>preferreditemsize</key><string>-1</string><key>showas</key><integer>2</integer><key>file-data</key><dict><key>_CFURLString</key><string>file:///Users/taylorjones/Dropbox/</string><key>_CFURLStringType</key><integer>15</integer></dict></dict><key>tile-type</key><string>directory-tile</string></dict>' 

## acknowledgements

Inspiration and code was taken from many sources, including:

- @alrra (Cãtãlin Mariş) https://github.com/alrra/dotfiles
- @mathiasbynens (Mathias Bynens) https://github.com/mathiasbynens/dotfiles
- @paulirish (Paul Irish) https://github.com/paulirish/dotfiles
