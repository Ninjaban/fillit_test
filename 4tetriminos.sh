#!/bin/bash

DIR="QUADRUPLE"
./generator $2 $(($RANDOM%8)) > TESTS/$DIR/test#$1
echo "" >> TESTS/$DIR/test#$1
./generator $3 $(($RANDOM%8)) >> TESTS/$DIR/test#$1
echo "" >> TESTS/$DIR/test#$1
./generator $4 $(($RANDOM%8)) >> TESTS/$DIR/test#$1
echo "" >> TESTS/$DIR/test#$1
./generator $5 $(($RANDOM%8)) >> TESTS/$DIR/test#$1
