#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Preferences\n"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   General Settings\n\n"

execute "defaults -currentHost write com.apple.screensaver moduleDict -dict moduleName Flurry path /System/Library/Screen\ Savers/Flurry.saver/ type 0" \
    "Set screensaver to 'Flurry'"

execute "defaults write -g AppleShowScrollBars -string 'Always'" \
    "Always show scrollbars"

execute "defaults write -g _HIHideMenuBar -bool true" \
    "Automatically hide and show the menu bar"

# killall to make settings take effect will be captured by the rest of the groups below

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Keyboard\n\n"

execute "defaults write -g 'InitialKeyRepeat_Level_Saved' -int 10" \
    "Set delay until repeat"

execute "defaults write -g KeyRepeat -int 1" \
    "Set the key repeat rate to fast"

# settings will take effect post restart

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   App Store\n\n"

execute "defaults write com.apple.appstore ShowDebugMenu -bool true" \
    "Enable debug menu"

execute "defaults write com.apple.commerce AutoUpdate -bool true" \
    "Turn on auto-update"

execute "defaults write com.apple.SoftwareUpdate AutomaticCheckEnabled -bool true" \
    "Enable automatic update check"

execute "defaults write com.apple.SoftwareUpdate AutomaticDownload -int 1" \
    "Download newly available updates in background"

execute "defaults write com.apple.SoftwareUpdate CriticalUpdateInstall -int 1" \
    "Install System data files and security updates"

killall "App Store" &> /dev/null

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Dashboard\n\n"

execute "defaults write com.apple.dashboard mcx-disabled -bool true" \
    "Disable Dashboard"

# `killall Dashboard` doesn't actually do anything. To apply the
# changes for `Dashboard`, `killall Dock` is enough as `Dock` is
# `Dashboard`'s parent process.

killall "Dock" &> /dev/null

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Dock\n\n"

execute "defaults write com.apple.dock autohide -bool true" \
    "Automatically hide/show the Dock"

execute "defaults write com.apple.dock autohide-delay -float 0" \
    "Disable the hide Dock delay"

execute "defaults write com.apple.dock tilesize -int 60" \
    "Set icon size"

execute "defaults write com.apple.dock mru-spaces -bool false" \
    "Do not automatically rearrange spaces based on most recent use"

execute "defaults write com.apple.dock wvous-tr-corner -int 5" \
    "Set top right hot corner to start screensaver"

execute "defaults write com.apple.dock wvous-br-corner -int 10" \
    "Set bottom right hot corner to start sleep"

killall "Dock" &> /dev/null

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Finder\n\n"

execute "defaults write com.apple.finder WarnOnEmptyTrash -bool false" \
    "Disable the warning before emptying the Trash"

execute "defaults write com.apple.finder FXDefaultSearchScope -string 'SCcf'" \
    "Search the current directory by default"

execute "defaults write com.apple.finder FXPreferredViewStyle -string 'clmv'" \
    "Use list view in all Finder windows by default"

execute "defaults write -g AppleShowAllExtensions -bool true" \
    "Show all filename extensions"

killall "Finder" &> /dev/null

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Keyboard\n\n"

execute "defaults write -g ApplePressAndHoldEnabled -bool false" \
    "Disable press-and-hold in favor of key repeat"

execute "defaults write -g 'InitialKeyRepeat_Level_Saved' -int 10" \
    "Set delay until repeat"

execute "defaults write -g KeyRepeat -int 1" \
    "Set the key repeat rate to fast"


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Photos\n\n"

execute "defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true" \
    "Prevent Photos from opening automatically when devices are plugged in"

killall "Photos" &> /dev/null

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Safari\n\n"

execute "defaults write com.apple.Safari com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled -bool true && \
         defaults write com.apple.Safari IncludeDevelopMenu -bool true && \
         defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true" \
    "Enable the 'Develop' menu and the 'Web Inspector'"

execute "defaults write com.apple.Safari IncludeInternalDebugMenu -bool true" \
    "Enable 'Debug' menu"

execute "defaults write -g WebKitDeveloperExtras -bool true" \
    "Add a context menu item for showing the 'Web Inspector' in web views"

killall "Safari" &> /dev/null

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   Terminal\n\n"

# If there is a Touch Bar, ensure the Touch ID is used when
# `sudo` is required.

if ioreg | grep -q "AppleEmbeddedOSSupportHost" \
    && ! grep -q "pam_tid.so" "/etc/pam.d/sudo"; then
    execute "sudo sh -c 'echo \"auth sufficient pam_tid.so\" >> /etc/pam.d/sudo'" \
        "Use Touch ID to authenticate sudo"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n   UI & UX\n\n"

execute "defaults write com.apple.screensaver askForPassword -int 1 && \
         defaults write com.apple.screensaver askForPasswordDelay -int 0"\
    "Require password immediately after into sleep or screen saver mode"

execute "defaults write -g NSNavPanelExpandedStateForSaveMode -bool true" \
    "Expand save panel by default"

execute "defaults write -g PMPrintingExpandedStateForPrint -bool true" \
    "Expand print panel by default"

killall "SystemUIServer" &> /dev/null