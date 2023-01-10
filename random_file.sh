#!/bin/bash
#Number of picked files
N=1

if [[ -z $@ ]]; then
    echo "Picks up random file from given directory and 
    echoes it with given path.
    Usage:
    random_file.sh directory"
fi
ls "$@" | sort -R | tail -$N | while read file; do
    echo "$@/$file"
done
exit 0
