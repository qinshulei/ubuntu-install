#!/bin/bash
#: Title                  : config-backup
#: Synopsis               : none
#: Date                   : 2014-08-29 10:22:17
#: Author                 : shulei
#: version                : 1.0
#: Description            : use to backup system-config file into backup directorys
#: Options                : -v set to display message

pushd $PWD

## Script path
script_path="${0%/*}"  # remove the script name ,get the path
script_path=${script_path/\./$(pwd)} # if path start with . , replace with $PWD
cd "${script_path}"

## source lib
source ../../libbash/bashr.sh

##init parameters
MESSAGE_ENABLED=n


## get parameters
## parse command-line options,  -m
while getopts "vb:" var
do
    case $var in
        v)
            MESSAGE_ENABLED=y
            ;;
    esac
done
shift $(( $OPTIND - 1 ))

HOST_NAME=$(echo `hostname`)

##content
echoH1 "Start to backup system setting into backup directory"

setup "validation of the .zshrc file exists" \
    ls ~/.zshrc \
    "Could find .zshrc" \
    ;

echoH2 "Backup .zshrc"
run "run cp .zshrc to directory" \
    cp -f "~/.zshrc" "../${HOST_NAME}-dotzshrc" \
    ;

if [ $? -ne 0 ]; then
    echo "backup .zshrc failed" | red
fi

popd > /dev/null
