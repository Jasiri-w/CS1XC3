#!/bin/bash

# Use First Argument As Working Directory
WDIR="$1"
# Not ${PWD} lmao
fname="file1.txt"

#tree "/tmp/wakyendj"
#echo "Working Directory: $WDIR"
#echo "@: $@"
#echo "1: $1"
#echo "2: $2"
#echo "#: $#"
#echo "User: $USER"
cd "$WDIR"

if [ $# -gt 2 ] ; then
	fname="$3"
fi

if [ $2 -eq 1 ] ; then
    if ! test -f "$fname"; then
	touch "$fname"
	echo "$USER" >> "$fname"
    fi
elif [ $2 -eq 2 ] ; then
	if test -f "$fname"; then
		if ! test -d "backup"; then
			mkdir "backup"
		fi
		cp "$fname" "./backup"
	fi
# Question 3: Check if second parameter has a value of 3
elif [ $2 -eq 3 ] ; then
	if test -f "backup/$fname" ; then
		cp "backup/$fname" "./$fname"
		rm "backup/file1.txt"
	fi
fi

if [ $# -gt 3 ] ; then
	if ! test -f "excess.txt" ; then
		touch "excess.txt"
	fi
	count=1
	for line in "$@"; do
		if [ $count -gt 3 ]; then
			echo "$line" >> "excess.txt"
		fi
		count=$((count+1))
	done
fi

echo "Finished"
