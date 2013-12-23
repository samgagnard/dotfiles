alias ls='ls -GF'
alias la='ls -latr'
alias ll='ls -ltr'
alias l='ls'
alias lc='clear; ls'
alias lgrep='ls -ltr | grep -i'

# I reference DOYs a lot more than actual date 
alias doy='date -u +%Y/%j-%H:%M:%S'

alias reset='source ~/.zshrc'

# Sequence for quickly killing/resetting the dock
# haven't had to use this in a while, but dash  used to be helpful...
alias dashoff='defaults write com.apple.dashboard mcx-disabled -boolean YES ; sleep 2 ; killall Dock ; echo Dashboard disabled.'
alias dashon='defaults write com.apple.dashboard mcx-disabled -boolean NO ; sleep 2 ; killall Dock ; echo Dashboard enabled.'
