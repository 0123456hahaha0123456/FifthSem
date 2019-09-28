#!/bin/bash


SCRIPTLOGS="$PWD/logs.txt"

if [ ! -f "$SCRIPTLOGS" ]; then
touch "$SCRIPTLOGS"
fi

echo "">result.txt
echo "">result1.txt

mails=$(echo $PATH | tr ":" "\n")
for addr in $mails
do
    find $addr -type f -executable >> result.txt
    while read -r line; do
    	#echo $line 
    	if [ -n $line ]; then
    		#file=$(basename $line) 2>>$SCRIPTLOGS
    		file=${line##*/}
    		echo $file >> result1.txt
    	fi
    	#((count=count+1))
	done <result.txt
    #gfind $addr -typem f -executable 2>>"$SCRIPTLOGS"
done

awk NF result1.txt > result.txt #NF for empty lines
sort -u result.txt #-u for duplicats file 



