#!/bin/bash

AppDir="/Applications"

if [ "$1" == "" ]
then
    for file in "${AppDir}/*"
    do
        appname=`basename ${file} | cut -d . -f 1`
        printf "${appname}\n"
    done
    exit 0
fi

if [ "$2" == "" ]
then
    echo "target is empty"
    exit 1
fi

AppName=$1.app
AppPath=${AppDir}/${AppName}
Target=$2

if [ ! -e "${AppPath}" ] || [ ! -e "${Target}" ]
then
    echo "${AppPath} or $2 not exist"
    exit 2
fi

mv "${AppPath}" "${Target}"
ln -s "${Target}/${AppName}" "${AppPath}"
