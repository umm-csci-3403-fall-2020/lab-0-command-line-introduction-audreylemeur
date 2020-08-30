#!/usr/bin/env bash

#Extract
tar -xf "NthPrime.tgz"

#Compile C programs
cd NthPrime || exit
gcc main.c nth_prime.c -o NthPrime

#Run C program
./NthPrime "$1" 
