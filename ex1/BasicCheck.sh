#!/bin/bash
dir=$1
program=$2
args=${@:3}
cd "$dir" || exit
if [ -f makefile ] || [ -f Makefile ] ;
	then 
		make MAIN="$dir/$program"
		if [ $? -eq 0 ]
			then
			chmod 755 $program
			valgrind --leak-check=full --error-exitcode=1 ./a.out
			result1=$?
			valgrind --tool=helgrind --error-exitcode=1 ./a.out
			result2=$?
			clear
			if [ $result1 -eq 0 ]
				then
				##result1 = 0
				resultString1="PASS";
			else
				##result1 = 1
				resultString1="FAILED"
				result1=$(($result1*2));
				##result1 = 2
			fi
			if [ $result2 -eq 0 ]
				then
				##result2 = 0
				resultString2="PASS";
			else
				##result2 = 1
				resultString2="FAILED"
			fi
			printf "BasicCheck.sh $dir $program $args\n"
			printf "Compilation\t  Memory leaks\t thread race\n"
			printf "PASS\t\t $resultString1\t\t $resultString2\n"
			exit $(($result1+$result2));
		else
			printf "BasicCheck.sh $dir $program $args\n"
			printf "Compilation\t Memory leaks\t thread race\n"
			printf "Failed\t\t Failed\t\t Failed\n"
			exit 7
		fi
	else
	echo "not found"
	exit
fi



