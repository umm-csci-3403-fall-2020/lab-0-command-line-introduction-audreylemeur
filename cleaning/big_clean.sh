#!/usr/bin/env bash

here=$(pwd)

SCRATCH=$(mktemp -d)
FILEBASE=$(basename -s .tgz "$1")

tar -xf "$1" -C "$SCRATCH"/

grep -rlz "DELETE ME!" "$SCRATCH"/"$FILEBASE" | xargs rm -rf

cd "$SCRATCH" || exit

for f in ./"$FILEBASE"
do
        BASE=$(basename "$f")
        mv "$f" "$FILEBASE"/cleaned_"$BASE"

done

tar -czf cleaned_"$1" "$FILEBASE"
mv cleaned_"$1" "$here"

rm -r "$SCRATCH"
