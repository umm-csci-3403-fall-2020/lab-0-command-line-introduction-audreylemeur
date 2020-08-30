#!/usr/bin/env bash

#Get current location
here=$(pwd)

#Make scratch directory
SCRATCH=$(mktemp -d)

#Get name of file parameter
FILEBASE=$(basename -s .tgz "$1")

#Extract file
tar -xf "$1" -C "$SCRATCH"/

#Remove marked files
grep -rlz "DELETE ME!" "$SCRATCH"/"$FILEBASE" | xargs rm -rf

#Move into scratch directory
cd "$SCRATCH" || exit

#Rename files to cleaned_
for f in ./"$FILEBASE"
do
        BASE=$(basename "$f")
        mv "$f" "$FILEBASE"/cleaned_"$BASE"

done

#Recompress file and move to original location
tar -czf cleaned_"$1" "$FILEBASE"
mv cleaned_"$1" "$here"

#Clean up scratch directory
rm -r "$SCRATCH"
