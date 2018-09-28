#!/bin/bash

# Ensure that the following actions
# are made relative to this file's path.
cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ask_for_sudo

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Create directories\n\n"
mkdir -p "$HOME/dev/ibm"
#      └─ make parent directories if needed

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

./create_symbolic_links.sh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Install nvm and node\n\n"

execute \
        "curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash" \
        "Install nvm"

# Make nvm command available to terminal
. ~/.nvm/nvm.sh

execute \
        "nvm install stable" \
        "Install node stable"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


./homebrew.sh
./install.sh
./preferences.sh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Install fonts\n\n"

# Install fonts into system-wide fonts directory
cd /Library/Fonts

# replace download links below with real dropbox links before running script
# curl params preserve the remote filename (-O,-J) and follows any redirects (-L)
execute \
        "curl -O -J -L https://www.dropbox.com/s/123abcwontwork/DankMono-Regular.otf?dl=0" \
        "Download Install Dank Mono Regular"

execute \
        "curl -O -J -L https://www.dropbox.com/s/123abcwontwork/DankMono-Italic.otf?dl=0" \
        "Download Install Dank Mono Italic"

# Ensure that the rest of the actions in this file
# are made relative to this file's path.
cd "$(dirname "${BASH_SOURCE[0]}")"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Restart\n\n"

ask_for_confirmation "Do you want to restart?"
printf "\n"

if answer_is_yes; then
    sudo shutdown -r now &> /dev/null
fi