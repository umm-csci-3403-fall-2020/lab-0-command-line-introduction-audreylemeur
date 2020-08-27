#!/usr/bin/env bash
tar -xf "NthPrime.tgz"
cd NthPrime
gcc main.c nth_prime.c -o NthPrime
./NthPrime $1 $2
