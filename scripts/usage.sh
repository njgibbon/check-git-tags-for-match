#!/bin/bash

sh check_git_tags_for_match.sh $1

if [ $? -eq 0 ]
then
    echo "Exit code was 0. Do some stuff."
    exit 0
else
    echo "Exit code was not 0. Do some stuff."
    exit 1
fi