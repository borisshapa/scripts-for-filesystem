#!/bin/bash

dir="$1"
if [[ -z "$dir" ]]; then
	dir="$(pwd)"
fi

declare -A dir_files

files="$(find $dir -type f)"
for file in $files; do
	hash="$(md5sum $file | awk '{print $1}')"
	size="$(wc -c $file | awk '{print $1}')"
	hash="$hash$size"
	source="${dir_files[$hash]}"
	if [[ -n "$source" ]]; then
		inode_source="$(ls -i $source | awk '{print $1}')"
		inode_file="$(ls -i $file | awk '{print $1}')"
		if [[ "$inode_source" == "$inode_file" ]]; then
			continue
		fi
		rm "$file"
		ln "$source" "$file"
		echo -e "\e[91mFile \e[39m\e[1m'$file'\e[0m\e[91m has been deleted.\n\e[39m`
			`\e[92mHard link \e[39m\e[1m'$file'\e[0m\e[92m to file \e[39m\e[1m'$source'\e[0m\e[92m has been created.\n\e[39m"
	else
		dir_files[$hash]="$file"
	fi
done

