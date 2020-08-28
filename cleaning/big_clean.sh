#!/usr/bin/env bash

here=$(pwd)

SCRATCH=$(mktemp -d)

tar -xf "$1" -C "$SCRATCH"/

grep -rlz "DELETE ME!" "$SCRATCH" | xargs rm -rf

cd "$SCRATCH" || exit

for f in ./*/*
do
        BASE=$(basename "$f")
        mv "$f" cleaned_"$BASE"
	echo "cleaned_$BASE"
done

tar -czf cleaned_"$1" "$SCRATCH"/*
mv cleaned_"$1" "$here"

rm -r "$SCRATCH"
