#!/bin/bash

function main
{
    checks
    logic
}

function checks
{
    # Check for no input arg passed in.
    if [ -z "$input" ]
    then
      echo "This script requires an argument input to search for a match over the git tags. No valid argument found. Exiting."
      exit 1
    fi

    # Use git validate utility to check the tag is of valid format.
    # We don't want the program to pass with a false positive because
    # the input arg would be impossible to find.
    formatted_tag_input="refs/tags/$input"
    git check-ref-format $formatted_tag_input
    if [ $? -ne 0 ]
    then
        echo "The input argument is not a valid git tag. See: https://git-scm.com/docs/git-check-ref-format. Exiting."
        exit 1
    fi
}

function logic
{
    if [ $( git tag -l "$input") ]
    then
        echo "This tag already exists in this repository. Exiting."
        exit 3
    else
        echo "This tag does not already exist in this repository. Success."
        exit 0
    fi
}

input=$1 #git tag value input to check if already exists
main