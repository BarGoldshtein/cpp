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
echo "1111111111111111111111111111111111111111111111ahsdkhashdfklshdflksdhklgwgljeflkdgjeflkdgjlfdjglkfjhlkfjhlkefdjhlkefjhlkefdjhlkef"
			chmod 755 $program
			valgrind --leak-check=full --error-exitcode=1 ./a.out
			result1=$?
			valgrind --tool=helgrind --error-exitcode=1 ./a.out
			result2=$?
##			clear
			if [ $result1 -eq 0 ]
				then
				echo "222222222222222222222222222222222222222222222222222222222"
echo $result1
printf"testtttttttttttttttttttttttttttttttt";
				##result1 = 0
				resultString1="PASS";
			else
echo "333333333333333333333333333333333333"
				##result1 = 1
				resultString1="FAILED"
				result1=$(($result1*2));
				##result1 = 2
			fi
			if [ $result2 -eq 0 ]
				then
echo "444444444444444444444444444444444"
				##result2 = 0
				resultString2="PASS";
			else
echo "55555555555555555555555555555555"
				##result2 = 1
				resultString2="FAILED"
			fi
echo "666666666666666666666666"
			printf "BasicCheck.sh $dir $program $args\n"
			printf "Compilation\t  Memory leaks\t thread race\n"
			printf "PASS\t\t $resultString1\t\t $resultString2\n"
			exit $(($result1+$result2));
		else
echo "77777777777777777777777777"
			printf "BasicCheck.sh $dir $program $args\n"
			printf "Compilation\t Memory leaks\t thread race\n"
			printf "Failed\t\t Failed\t\t Failed\n"
			exit 7
		fi
	else
echo "88888888888888888888888888888888888888"
	echo "not found"
	exit
fi



