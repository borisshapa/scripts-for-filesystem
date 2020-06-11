#!/bin/bash

read -r file

file="/tmp/files/$file"
path="$(readlink -m $file)"

if [[ $path != /tmp/files* ]]; then
        echo -e "\e[91mThe specified path is above a valid directory.\e[39m"
        exit 0
fi

if [[ ! -f "$path" ]]; then
	echo -e "\e[91mThere is no such file.\e[39m"
	exit 0
fi

cat "$path"
