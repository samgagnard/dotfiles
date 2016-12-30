
trash() {
    if [ -z $1 ]; then echo "usage: trash [file]"; return; fi 
    mv -f $1 ~/.Trash
}

