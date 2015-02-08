#!/bin/bash
#: Title                  : install-global
#: Synopsis               : none
#: Date                   : 2014-08-29 15:46:22
#: Author                 : shulei
#: version                : 1.0
#: Description            : install global
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
echoH1 "Start install global"

setup "validation ~/source-install directory exists" \
    ls ~/source-install \
    "can't find ~/source-install dir ,please create it first" \
    ;

setup "validation ctags exists" \
    ls /usr/local/bin/ctags \
    "can't ctags ,please install it first" \
    ;

setup "create ~/source-install/global workspace" \
    mkdir ~/source-install/global \
    "can't creat ~/source-install/global dir, please check the reason" \
    ;

setup "cp global tar file into  ~/source-install/global" \
    cp -r global-6.3.1.tar.gz ~/source-install/global \
    "cp tar file into ~/source-install/global failed" \
    ;

## change dir
cd ~/source-install/global/
setup "tar the global tar file" \
    tar -xf global-6.3.1.tar.gz \
    "tar the global tar file failed" \
    ;

setup "install libncurses5-dev libs" \
    sudo apt-get install -y -q libncurses5-dev \
    "install libncurses5-dev lib failed" \
    ;

cd ~/source-install/global/global-6.3.1/
echoH2 "try build global"
setup "run configure" \
    ./configure --with-exuberant-ctags=/usr/local/bin/ctags \
    "global configure failed" \
    ;

setup "make install" \
    sudo make install \
    "global make install failed" \
    ;

popd > /dev/null
