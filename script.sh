#!/bin/bash

printf '\e[4m%s\e[m\n' "Generation des fichiers..."
mkdir -p TESTS/SIMPLE/
mkdir -p TESTS/DOUBLE/
mkdir -p TESTS/TRIPLE/
mkdir -p TESTS/QUADRUPLE/

nbr=0
NAME="1 tetriminos"
INDEX=0
NB=$((19*19))
for type in `seq 1 19`
do
	for pos in `seq 0 8`
	do
		DONE=$(($INDEX*40/$NB))
		PERCENT=$(($INDEX*100/$NB))
		TO_DO=$((40-$INDEX*40/$NB - 1))
		COLOR=$(list=(17 18 19 20 21 25 26 27 32 33 38 39 44 45 50 51); index=$(($PERCENT * ${#list[@]} / 100)); echo "${list[$index]}")
		printf "\r\033[38;5;%dm⌛ [%s]: `printf "%${DONE}s" | sed 's/ /█/g'`%*s❙ %2d%%\033[0m\033[0m" $COLOR "$NAME" $TO_DO "" $PERCENT

		./generator $type $pos > TESTS/SIMPLE/test#$nbr
		nbr=`expr $nbr + 1`

		INDEX=$(($INDEX+1))
	done
done

printf '\r\e[32m✓\e[m [%s]: \e[36m%d\e[m %s                  \n' "$NAME" $nbr "fichiers ont été crées"

nbr=0
NAME="2 tetriminos"
INDEX=0
NB=$((19*19))
for type in `seq 1 19`
do
	for type2 in `seq 1 19`
	do
		DONE=$(($INDEX*40/$NB))
		PERCENT=$(($INDEX*100/$NB))
		TO_DO=$((40-$INDEX*40/$NB - 1))
		COLOR=$(list=(17 18 19 20 21 25 26 27 32 33 38 39 44 45 50 51); index=$(($PERCENT * ${#list[@]} / 100)); echo "${list[$index]}")
		printf "\r\033[38;5;%dm⌛ [%s]: `printf "%${DONE}s" | sed 's/ /█/g'`%*s❙ %2d%%\033[0m\033[0m" $COLOR "$NAME" $TO_DO "" $PERCENT

		./generator $type $(($RANDOM%8)) > TESTS/DOUBLE/test#$nbr
		echo "" >> TESTS/DOUBLE/test#$nbr
		./generator $type2 $(($RANDOM%8)) >> TESTS/DOUBLE/test#$nbr

		nbr=`expr $nbr + 1`

		INDEX=$(($INDEX+1))
	done
done

printf '\r\e[32m✓\e[m [%s]: \e[36m%d\e[m %s                  \n' "$NAME" $nbr "fichiers ont été crées"

nbr=0
NAME="3 tetriminos"
INDEX=0
NB=$((19*19*19))
for type in `seq 1 19`
do
	for type2 in `seq 1 19`
	do
		for type3 in `seq 1 19`
		do
			DONE=$(($INDEX*40/$NB))
			PERCENT=$(($INDEX*100/$NB))
			TO_DO=$((40-$INDEX*40/$NB - 1))
			COLOR=$(list=(17 18 19 20 21 25 26 27 32 33 38 39 44 45 50 51); index=$(($PERCENT * ${#list[@]} / 100)); echo "${list[$index]}")
			printf "\r\033[38;5;%dm⌛ [%s]: `printf "%${DONE}s" | sed 's/ /█/g'`%*s❙ %2d%%\033[0m\033[0m" $COLOR "$NAME" $TO_DO "" $PERCENT

			bash 3tetriminos.sh $nbr $type $type2 $type3 &
			nbr=`expr $nbr + 1`

			INDEX=$(($INDEX+1))
		done
	done
done

printf '\r\e[32m✓\e[m [%s]: \e[36m%d\e[m %s                  \n' "$NAME" $nbr "fichiers ont été crées"

nbr=0
NAME="4 tetriminos"
INDEX=0
NB=$((19*19*19*19))
for type in `seq 1 19`
do
	for type2 in `seq 1 19`
	do
		for type3 in `seq 1 19`
		do
			for type4 in `seq 1 19`
			do
				DONE=$(($INDEX*40/$NB))
				PERCENT=$(($INDEX*100/$NB))
				TO_DO=$((40-$INDEX*40/$NB - 1))
				COLOR=$(list=(17 18 19 20 21 25 26 27 32 33 38 39 44 45 50 51); index=$(($PERCENT * ${#list[@]} / 100)); echo "${list[$index]}")
				printf "\r\033[38;5;%dm⌛ [%s]: `printf "%${DONE}s" | sed 's/ /█/g'`%*s❙ %2d%%\033[0m\033[0m" $COLOR "$NAME" $TO_DO "" $PERCENT

				bash 4tetriminos.sh $nbr $type $type2 $type3 $type4 &
				nbr=`expr $nbr + 1`

				INDEX=$(($INDEX+1))
			done
		done
	done
done

printf '\r\e[32m✓\e[m [%s]: \e[36m%d\e[m %s                  \n' "$NAME" $nbr "fichiers ont été crées"
printf '\n\e[4m%s\e[m\n' "Début des tests..."

mkdir -p RESULT/SIMPLE/
mkdir -p RESULT/DOUBLE/
mkdir -p RESULT/TRIPLE/
mkdir -p RESULT/QUADRUPLE/
mkdir -p SOLUCE/SIMPLE/
mkdir -p SOLUCE/DOUBLE/
mkdir -p SOLUCE/TRIPLE/
mkdir -p SOLUCE/QUADRUPLE/

printf 'Tests 1 tetriminos...'

DIR="SIMPLE"
files=`expr $(ls -1 TESTS/$DIR | wc -l ) - 1`
for nbr in `seq 0 $files`
do
#	./fillit TESTS/$DIR/test#$nbr > SOLUCE/$DIR/soluce#$nbr
	./fillit TESTS/$DIR/test#$nbr > RESULT/$DIR/result#$nbr
	result=$(diff RESULT/$DIR/result#$nbr SOLUCE/$DIR/soluce#$nbr)
	if [ "$result" != "" ]
	then
		printf '\e[31m%s\e[m\n' "Fail"
		printf '\e[36m%s\e[m\n' "Fichier :"
		cat TESTS/$DIR/test#$nbr
		printf '\n\e[36m%s\e[m\n' "Attendu :"
		cat SOLUCE/$DIR/soluce#$nbr
		printf '\n\e[36m%s\e[m\n' "Obtenu :"
		cat RESULT/$DIR/result#$nbr
		exit 1
	fi
done

printf '\e[32m%s\e[m\n' "Succès"
printf 'Tests 2 tetriminos...'

DIR="DOUBLE"
files=`expr $(ls -1 TESTS/$DIR | wc -l ) - 1`
for nbr in `seq 0 $files`
do
#	./fillit TESTS/$DIR/test#$nbr > SOLUCE/$DIR/soluce#$nbr
	./fillit TESTS/$DIR/test#$nbr > RESULT/$DIR/result#$nbr
	result=$(diff RESULT/$DIR/result#$nbr SOLUCE/$DIR/soluce#$nbr)
	if [ "$result" != "" ]
	then
		printf '\e[31m%s\e[m\n' "Fail"
		printf '\e[36m%s\e[m\n' "Fichier :"
		cat TESTS/$DIR/test#$nbr
		printf '\n\e[36m%s\e[m\n' "Attendu :"
		cat SOLUCE/$DIR/soluce#$nbr
		printf '\n\e[36m%s\e[m\n' "Obtenu :"
		cat RESULT/$DIR/result#$nbr
		exit 1
	fi
done

printf '\e[32m%s\e[m\n' "Succès"
printf 'Tests 3 tetriminos...'

DIR="TRIPLE"
files=`expr $(ls -1 TESTS/$DIR | wc -l ) - 1`
for nbr in `seq 0 $files`
do
#	./fillit TESTS/$DIR/test#$nbr > SOLUCE/$DIR/soluce#$nbr
	./fillit TESTS/$DIR/test#$nbr > RESULT/$DIR/result#$nbr
	result=$(diff RESULT/$DIR/result#$nbr SOLUCE/$DIR/soluce#$nbr)
	if [ "$result" != "" ]
	then
		printf '\e[31m%s\e[m\n' "Fail"
		printf '\e[36m%s\e[m\n' "Fichier :"
		cat TESTS/$DIR/test#$nbr
		printf '\n\e[36m%s\e[m\n' "Attendu :"
		cat SOLUCE/$DIR/soluce#$nbr
		printf '\n\e[36m%s\e[m\n' "Obtenu :"
		cat RESULT/$DIR/result#$nbr
		exit 1
	fi
done

printf '\e[32m%s\e[m\n' "Succès"
printf 'Tests 4 tetriminos...'

DIR="QUADRUPLE"
files=`expr $(ls -1 TESTS/$DIR | wc -l ) - 1`
for nbr in `seq 0 $files`
do
#	./fillit TESTS/$DIR/test#$nbr > SOLUCE/$DIR/soluce#$nbr
	./fillit TESTS/$DIR/test#$nbr > RESULT/$DIR/result#$nbr
	result=$(diff RESULT/$DIR/result#$nbr SOLUCE/$DIR/soluce#$nbr)
	if [ "$result" != "" ]
	then
		printf '\e[31m%s\e[m\n' "Fail"
		printf '\e[36m%s\e[m\n' "Fichier :"
		cat TESTS/$DIR/test#$nbr
		printf '\n\e[36m%s\e[m\n' "Attendu :"
		cat SOLUCE/$DIR/soluce#$nbr
		printf '\n\e[36m%s\e[m\n' "Obtenu :"
		cat RESULT/$DIR/result#$nbr
		exit 1
	fi
done

printf '\e[32m%s\e[m\n' "Succès"
printf '\n\e[4m%s\e[m\n' "Suppression des tests..."
printf 'Suppression de TESTS/...'
rm -rf TESTS/
printf '\e[32m%s\e[m\n' "Ok"
printf 'Suppression de RESULT/...'
rm -rf RESULT/
printf '\e[32m%s\e[m\n' "Ok"
