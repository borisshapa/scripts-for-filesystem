#!/bin/bash

if [[ "$#" != 2 ]]; then
	echo -e "\e[91mEnter 2 paths.\e[39m"
	exit 0
fi

first="$1"
second="$2"

if [[ ! -f "$first" ]]; then
        echo -e "\e[91mFirst is not a file.\e[39m"
        exit 0
fi

if [[ ! -f "$second" ]]; then
        echo -e "\e[91mSecond is not a file.\e[39m"
        exit 0
fi

inode_fi="$(ls -i $first | awk '{print $1}')"
inode_se="$(ls -i $second | awk '{print $1}')"

if [[ "$inode_fi" == "$inode_se" ]]; then
	echo -e "\e[92mRefer to the same file.\e[39m"
else
	echo -e "\e[92mRefer to different file.\e[39m"
fi


