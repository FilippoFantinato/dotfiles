#!/bin/bash

filename=$1

while read -r line; do
	firstCharacter=${line:0:1}

	if [[ $firstCharacter == '-' ]]; then
		cd -
		nextDirectory=`echo $line | cut -d ' ' -f2`
		mkdir -p $nextDirectory
		cd $nextDirectory
	else
		if [[ -n -z $line ]]; then
			git clone $line
		fi
	fi

done < $filename
