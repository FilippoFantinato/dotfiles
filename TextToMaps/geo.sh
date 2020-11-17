#!/bin/bash

file=geo.txt
out=maps.html
i=1

echo "" > $out

while read -r line; do

	echo "<p><a href='`python3 geo.py \"$line\"`'>${i}</a><br />${line}</p>" >> $out
	i=$((i+1))

done < $file
