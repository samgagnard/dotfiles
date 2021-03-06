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
alias new='login -pfq $USER'
alias ssh='ssh -X'

alias samgagnard.com cd ~/Dropbox/Public/samgagnard.com

# Scripts - now part of $PATH in ~/code/bin
#alias doy2date='$HOME/scripts/doy2date.sh'
#alias date2doy='$HOME/scripts/date2doy.sh'

# Sequence for quickly killing/resetting the dock
# I've found this to be occassionally/marginally useful...
alias dashoff='defaults write com.apple.dashboard mcx-disabled -boolean YES ; sleep 2 ; killall Dock ; echo Dashboard disabled.'
alias dashon='defaults write com.apple.dashboard mcx-disabled -boolean NO ; sleep 2 ; killall Dock ; echo Dashboard enabled.'

# alias for anaconda python
alias conda='$HOME/anaconda/bin/conda'
