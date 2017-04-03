#!/bin/bash

declare -r GITHUB_REPOSITORY="tay1orjones/dotfiles"

declare -r DOTFILES_ORIGIN="git@github.com:$GITHUB_REPOSITORY.git"
declare -r DOTFILES_TARBALL_URL="https://github.com/$GITHUB_REPOSITORY/tarball/master"
declare -r DOTFILES_UTILS_URL="https://raw.githubusercontent.com/$GITHUB_REPOSITORY/master/src/os/utils.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

declare dotfilesDirectory="$HOME/sourcecontrol/dotfiles"
declare skipQuestions=false

link() {
    # Force create/replace the symlink.
    ln -fs "${DOTFILES_DIRECTORY}/${1}" "${HOME}/${2}"
}

printf "Create Symlink"
# Create the necessary symbolic links between the `.dotfiles` and `HOME`
# directory. The `bash_profile` sources other files directly from the
# `.dotfiles` repository.
link "shell/.bashrc"       ".bashrc"
link "shell/.bash_profile" ".bash_profile"
link "shell/.inputrc"      ".inputrc"
link "git/.gitattributes"  ".gitattributes"
link "git/.gitignore"      ".gitignore"


