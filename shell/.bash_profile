source ~/.bash_prompt

export EDITOR="code"

# Setup NVM
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh
nvm use stable

# ALIASES
alias atom="atom ./"
alias code="code ./"
# Projects
alias cs="cd sourcecontrol"
alias guide="cd sourcecontrol/guide"
# A better list all
alias ls="ls -a"
# Show/hide hidden files in Finder
alias showdotfiles="defaults write com.apple.finder AppleShowAllFiles -bool true && killall Finder"
alias hidedotfiles="defaults write com.apple.finder AppleShowAllFiles -bool false && killall Finder"
# Hide/show all desktop icons (useful when presenting)
alias showdeskicons="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"
alias hidedeskicons="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
# Update/reloat bash_profile
alias reload="source ~/.bash_profile"
# Display ANSI 16 colors - doesn't work atm
# alias printcolors () {
#   for i in {0..15}; do
#     printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i";
#     if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
#       printf "\n";
#     fi
#   done
# }
