#!/bin/bash

# Ensure that the following actions
# are made relative to this file's path.
cd "$(dirname "${BASH_SOURCE[0]}")" \
    && . "utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

ask_for_sudo

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Create directories\n\n"
mkdir -p "$HOME"/dev/ibm
#      └─ make parent directories if needed

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Create symbolic links\n\n"
# Create the necessary symbolic links between the `.dotfiles` and `HOME`
# directory.
ln -fs "shell/.bash_logout" ".bash_logout"
ln -fs "shell/.bash_profile" ".bash_profile"
ln -fs "shell/.bash_prompt" ".bash_prompt"
ln -fs "shell/.bashrc" ".bashrc"
ln -fs "shell/.inputrc" ".inputrc"
ln -fs "shell/.hushlogin" ".hushlogin"

ln -fs "git/.gitattributes" ".gitattributes"
ln -fs "git/.gitconfig-ibm" ".gitconfig-ibm"
ln -fs "git/.gitconfig" ".gitconfig"
ln -fs "git/.gitignore" ".gitignore"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Install nvm and node\n\n"

printf "\n" | ruby -e "$(curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh)" &> /dev/null
#  └─ simulate the ENTER keypress
print_result $? "Install nvm"

execute \
        "nvm install stable" \
        "Install node stable"
        
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -


./homebrew.sh
./install.sh
./preferences.sh

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

print_in_purple "\n • Restart\n\n"

ask_for_confirmation "Do you want to restart?"
printf "\n"

if answer_is_yes; then
    sudo shutdown -r now &> /dev/null
fi