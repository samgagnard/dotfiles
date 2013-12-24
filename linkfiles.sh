#!/usr/bin/env bash
#--------------------------------------------------------------------------------
# AUTHOR: Sam Gagnard
#
# DESCRIPTION: 
#    Links the *.link files in dotfiles directory to user home directory. Script
#    will prompt to skip/overwrite any existing versions. 
#
# USAGE: 
#     linkfiles.sh [--h|help]
#
# OPTIONS
#     -h|--help     Show the usage message
#
# NOTES: 
#--------------------------------------------------------------------------------

set -e # for good practice

# Function template adapted from: 
# https://github.com/thcipriani/bashtemplate

## Variable definitions

normal=$(tput sgr0)
bold=$(tput bold)
red=$(tput setaf 1)
green=$(tput setaf 2)
yellow=$(tput setaf 3)
blue=$(tput setaf 4)
magenta=$(tput setaf 5)
cyan=$(tput setaf 6)

## Function definitions

usage() {
    cat << EOF

    USAGE: $(basename $0) [OPTIONS]

    This program will symlink all the *.link files within the .dotfiles hierarchy
    into the user's home directory. If nonlink versions are found, the user is 
    prompted to either skip or replace the existing file. Previous versions are
    backed up within the current directory. 

    OPTIONS:
            -h|--help           Display help message

EOF
    exit $1
}

info() {
    printf "%b" "[${green}...${normal}] $1\n"
}

note() {
    printf "%b" "[${cyan} ! ${normal}] $1\n"
}

prompt() {
    printf "%b" "[${yellow} ? ${normal}] $1\n> "
    read "$2" 
}

error() {
    printf "%b" "[${red}ERROR${normal}] ${0}: ${1:-'Unkown Error'}\n" >&2
}

fail() {
    error "$1"
    case $2 in
        ''|*[!0-9]*)
            exit_code=1
            ;;
        *)
            exit_code=$2
        ;;
    esac
    exit $exit_code
}

check_args() {
    while [ ! -z "$1" ]; do
        local arg="$1"
       
        case "$1" in
            -h|--help)
                usage                 
                exit 0 
                ;;
            *)
                fail "Unkown option $1 ; see --help"
                ;;
        esac
    done
}

## Main Functions

create_backup() {
    
    date_str=$(date +%Y-%m-%d.%H.%M)
    backup_file="$1.$date_str"
    
    cp -f $1 $backup_file
    info "Original has been saved to $backup_file"
}

link_files() {
    info "Creating link: $dest -> $source"
    ln -sf $1 $2
}

check_for_dotfile() {

    source=$1                         # e.g. ~/.dotfiles/zshrc.link 
    link_file=$(basename $1)          # e.g. zshrc.link
    dotfile_name=".${link_file%.*}"   # e.g. .zshrc
    dest="$HOME/$dotfile_name"        # e.g. /home/you/.zshrc

    while true  # wait for valid input
    do
        # Check for existence of non-link files, prompt action
        if [[ -e $dest ]] && ! [[ -h $dest ]]; then
            note "Existing file $dotfile_name found in $HOME"
            prompt "Would you like to: [r]eplace, or [s]kip this file (backup will be made)?" answer 

            case $answer in
                r|R)
                    create_backup $dest
                    link_files $source $dest
                    return
                    ;;
                s|S)
                    return
                    ;;
                *)
                    error "Unknown answer; skipping this file"
                    continue #retry
                    ;;
            esac    
        else
            link_files $source $dest
            return
        fi  
    done    
}

main() {

    # Attempt to make this work the same from all locations 
    this_dir=$(dirname $0)
    cd $this_dir

    DOTFILES_DIR=$(pwd)    
   
    # Verify inputs
    check_args "$@"

    printf "\nThis program will link *.link files in the dotfiles directory to \$HOME\n"
    printf "Note that any existing links on dotfiles will be redefined\n\n"
    
    # Search for link file in the dotfiles directory tree 
    linkfiles=$(find $DOTFILES_DIR -maxdepth 2 -name \*.link)
    for file in $linkfiles; do
        check_for_dotfile "$file" 
    done
    echo
}

main "$@"
