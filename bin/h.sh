#! /bin/bash

function show_usage {
    cat <<- _EOF_

Search Bash History using Grep and Percol

Examples:
    $ h ssh
    $ h 'ssh user@'

_EOF_
    exit 1
}

#Sanity check - Need one argument
if [ $# -ne 1 ]; then
    show_usage
fi

#If bash_history doesn't exist
if [ -f ~/.zsh_history ]; then
    cat ~/.zsh_history | grep $1 | percol
elif [ -f ~/.bash_history ]; then
    cat ~/.zsh_history | grep $1 | percol
else
    show_usage
fi
