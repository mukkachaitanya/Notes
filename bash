 - use echo with ' ' to print preserve special charcters
 	echo 'hello@$\'

 - use read -r to read lines with special charcters.

 - can use 'declare' keyword to declare variable:
 	-a (Array), -i (integer), 

 - declare -a Array
 	Array=(1 help try 3.5)

 	echo $(Array) #prints the array

 	echo $(Array[1]) #prints the 2nd element of the array

 	unset Array[1]  #deletes 2nd element

