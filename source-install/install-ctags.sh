#!/bin/bash
#: Title                  : install-ctages
#: Synopsis               : none
#: Date                   : 2014-08-29 15:46:01
#: Author                 : shulei
#: version                : 1.0
#: Description            : install ctags
#: Options                : -v set to display message

pushd $PWD

## Script path
script_path="${0%/*}"  # remove the script name ,get the path
script_path=${script_path/\./$(pwd)} # if path start with . , replace with $PWD
cd "${script_path}"

## source lib
source ../libbash/bashr.sh

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

##content
echoH1 "Start install ctags"

setup "validation ~/source-install directory exists" \
    ls ~/source-install \
    "can't find ~/source-install dir ,please create it first" \
    ;

setup "create ~/source-install/ctags workspace" \
    mkdir ~/source-install/ctags \
    "can't creat ~/source-install/ctags dir, please check the reason" \
    ;

setup "cp ctags tar file into  ~/source-install/ctags" \
    cp -r ctags-5.8.tar.gz ~/source-install/ctags \
    "cp tar file into ~/source-install/ctags failed" \
    ;

## change dir
cd ~/source-install/ctags/
setup "tar the ctags tar file" \
    tar -xf ctags-5.8.tar.gz \
    "tar the ctags tar file failed" \
    ;

cd ~/source-install/ctags/ctags-5.8/
echoH2 "try build ctags"
setup "run configure" \
    ./configure \
    "ctags configure failed" \
    ;

setup "make install" \
    sudo make install \
    "ctags make install failed" \
    ;

popd > /dev/null
