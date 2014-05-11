# File listing
alias ls='ls -GF'
alias la='ls -latr'
alias ll='ls -ltr'
alias l='ls'
alias lc='clear; ls'
alias lgrep='ls -ltr | grep -i'

# Other useful stuff
alias doy='date -u +%Y/%j-%H:%M:%S'
alias reset='source ~/.zshrc'
alias desk='cd ~/Desktop'

# Sequence for quickly killing/resetting the dock
# I've found this to be occassionally/marginally useful...
alias dashoff='defaults write com.apple.dashboard mcx-disabled -boolean YES ; sleep 2 ; killall Dock ; echo Dashboard disabled.'
alias dashon='defaults write com.apple.dashboard mcx-disabled -boolean NO ; sleep 2 ; killall Dock ; echo Dashboard enabled.'
