#!/bin/bash
#array

function evenodd()
{
	if [ $(expr "$1" % 2) -eq 1 ]
	then
		echo "1"
	else
		echo "2"	
	fi
}


function hcheck()
{
	#echo "hcheck"
	if [ "$1" -eq 1 -o "$1" -eq 4 -o "$1" -eq 7 ]
	then
		if [ "${arr[$(expr "$1" + 1)]}" -eq "$2" -a "${arr[$(expr "$1" + 2)]}" -eq "$2" ]
		then
			echo "1"
		else
			echo "0"
		fi
		elif [ "$1" -eq 3 -o "$1" -eq 6 -o "$1" -eq 9 ]
		then
			if [ "${arr[$(expr "$1" - 1)]}" -eq "$2" -a "${arr[$(expr "$1" - 2)]}" -eq "$2" ]
			then
				echo "1"
			else
				echo "0"
			fi
		else
			if [ "${arr[$(expr "$1" + 1) ]}" -eq "$2" -a "${arr[$(expr "$1" - 1)]}" -eq "$2" ]
			then
				echo "1"
			else
				echo "0"
			fi
	fi
}




function vcheck()
{
	#echo "vcheck: $1 ,$2"
	if [ "$1" -eq 1 -o "$1" -eq 2 -o "$1" -eq 3 ]
	then
		if [ "${arr[$(expr "$1" + 3)]}" -eq "$2" -a "${arr[$(expr "$1" + 6)]}" -eq "$2" ]
		then
			echo "1"
		else
			echo "0"
		fi
	elif [ "$1" -eq 7 -o "$1" -eq 8 -o "$1" -eq 9 ]
	then
		if [ "${arr[$(expr "$1" - 3)]}" -eq "$2" -a "${arr[$(expr "$1" - 6)]}" -eq "$2" ]
		then
			echo "1"
		else
			echo "0"
		fi
	else
		if [ "${arr[$(expr "$1" + 1)]}" -eq "$2" -a "${arr[$(expr "$1" - 1)]}" -eq "$2" ]
		then
			echo "1"
		else
			echo "0"
		fi
	fi
}


function dcheck()
{
	#echo "dcheck"
	if [ "$1" -eq 1 -o "$1" -eq 9 -o "$1" -eq 5 ]
	then
		if [ "${arr[1]}" -eq "$2" -a "${arr[5]}" -eq "$2" -a "${arr[9]}" -eq "$2" ]
		then
			echo "1"
		else
			echo "0"
		fi
	elif [ "$1" -eq 3 -o "$1" -eq 7 -o "$1" -eq 5 ]
	then
		if [ "${arr[3]}" -eq "$2" -a "${arr[5]}" -eq "$2" -a "${arr[7]}" -eq "$2" ]
		then
			echo "1"
		else
			echo "0"
		fi
	fi
}

function print()
{
	loop=$1
	echo -ne "\n\t\t\t\t****Tic Tac Toe***** \n"
	echo -ne "\n\t\t\t\t"
	while [ $loop -le 9 ]
	do
		xo=${arr[loop]}
		
		if [ $xo -eq 1 ]
		then
			echo -n -e "X \t"
		elif [ $xo -eq 2 ]
		then
			echo -n -e "O \t"
		else
			echo -n -e "_ \t"
		fi
		if [ $(expr $loop % 3) -eq 0 ]
		then
			echo ""
			
			echo -ne "\n\t\t\t\t"
		fi	
		loop=$(expr $loop + 1)
	done
}


declare -a arr
i=1
echo -ne "\t\t\t\t****Welcome to Game***** "
while [ "$i" -le 9 ]
do
	arr["$i"]=0
	i=$(expr "$i" + 1)
done

print 1					#print



i=1
while [ "$i" -le 9 ]
do
	

	player=$(evenodd $i)

	echo -ne "\nEnter your position 1-9 (X-Player 1 and O-player 2) Player=$player :"
	read p	
	if [ "${arr[p]}" -eq 0 ]
	then
		
		if [ "$player" -eq 1 ]
		then
			arr[$p]=1
			v1=$(vcheck "$p" 1)
			h1=$(hcheck "$p" 1)
			d1=$(dcheck "$p" 1)
			#echo "v1:$v1,h1:$h1,d1:$d1"
			if [ $v1 -eq 1 ] 			#1
			then
				clear
				print 1				
				echo -ne "\n\t\t\t#####Player 1 has won the Game!!!!######\n"
				
				exit
			fi
			if [ "$d1" -eq 1 ]			#2
			then
				clear
				print 1
				echo -ne "\n\t\t\t#####Player 1 has won the Game!!!!######\n"
				
				exit
			fi
			if [ "$h1" -eq 1 ]			#3
			then
				clear
				print 1
				echo -ne "\n\t\t\t#####Player 1 has won the Game!!!!######\n"
				
				exit
			fi
		else
			arr[$p]=2
			v2=$(vcheck "$p" 2)
			h2=$(hcheck "$p" 2)
			d2=$(dcheck "$p" 2)
			#echo "v2:$v2,h2:$h2,d2:$d2"
			if [ "$v2" -eq 1 ]			#4
			then
				clear
				print 1				
				echo -ne "\n\t\t\t#####Player 2 has won the Game!!!!######\n"
				exit
				
			fi
			if [ "$d2" -eq 1 ]			#5
			then
				clear
				print 1
				echo -ne "\n\t\t\t#####Player 2 has won the Game!!!!######\n"
				
				exit
			fi
			if [ "$h2" -eq 1 ]			#6
			then
				clear
				print 1				
				echo -ne "\n\t\t\t#####Player 2 has won the Game!!!!######\n"
				exit
				
			fi
		fi
	else
		echo "Already entered"
		continue
	fi					#print
	i=$(expr "$i" + 1)
	clear
	print 1
done
echo "Game Tied"












