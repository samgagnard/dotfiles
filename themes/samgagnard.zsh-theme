# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
# zsh theme file 
# Sam Gagnard - December 2013 
# Reference: Adapted largely from robbyrussell theme file
# =-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

local dc='%{%f%k%}' # default color

function print_git() {
  print "$dc$(git_prompt_info)$dc"
}

function print_svn() {
  print "$dc$(svn_prompt_info)$dc"
}

function get_date() {
  print "$(date -u +%j-%H:%M)z"
}

function get_length() {
    # The following variables were adapted from  Phil!'s ZSH prompt
    # http://aperiodic.net/phil/prompt/
    local DIRLEN=${#${(%):-%c}} # current directory string
    local PWDLEN=${#${(%):-%~}} # full pwd string (not used right now) 

    # Return the length of the string for the current dir + ellipsis (4)
    # e.g. .../[current_dir]
    local LEN=$(( $DIRLEN + 4 ))
    print "$LEN"
}

# Color variables - see spectrum_ls 
c1=013 # "good" colors
c2=012
c3=011
#------
c4=009 # "bad" colors 
c5=010
c6=011

function ret_status() {
    # Colorize prompt char for return status
    #local ret="%(?:%{$FG[$c1]%}●%{$FG[$c2]%}●%{$FG[$c3]%}●:%{$FG[$c4]%}●%{$FG[$c5]%}●%{$FG[$c6]%}●)"
    #local ret="%(?:%{$FG[$c1]%}〉:%{$FG[$c4]%}✖ )"
    local ret="%(?:%{$FG[$c1]%}:%{$FG[$c4]%}✖ )"
    print "$dc$ret$dc"
}

function dir_status() {
    # Colorizes directory listing for return status
    local ret="%(?:%{$FG[$c1]%}:%{$FG[$c4]%})"
    print "$dc$ret"
}

# -----------------------------------------------------------------------------

## Set the left prompt 
PROMPT='$(dir_status)%$(get_length)<...< %~%<< $(ret_status)' # new colors

## Set the right prompt 
RPROMPT='$(print_git)'

# -----------------------------------------------------------------------------
# These environmental variables are used by the programs *prompt_info
# to display git/svn etc. information. The print_git() function above, for 
# example, just calls git_prompt_info(), which relies on the environmentals 
# being configured here at startup.

## git status variables 

# Past examples: 
# ZSH_THEME_GIT_PROMPT_PREFIX="git(%{$fg[green]%}"
# ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%}) %{$fg[yellow]%}✗ %{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%}) %{$fg[green]%}✔ %{$reset_color%}"
# ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[magenta]%}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[252]%}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$reset_color%} %{$fg[yellow]%}✗ %{$reset_color%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$reset_color%} %{$fg[green]%}✔ %{$reset_color%}"

## svn status variables

# NOTE: this seems to be verrrrrry slowwww for SVN status
ZSH_THEME_SVN_PROMPT_PREFIX="svn(%{$fg[252]%}"
ZSH_THEME_SVN_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_SVN_PROMPT_DIRTY="%{$reset_color%}) %{$fg[yellow]%}✗ %{$reset_color%}"
ZSH_THEME_SVN_PROMPT_CLEAN="$%{$reset_color%}) %{$fg[green]%}✔ %{$reset_color%}"
