# check-git-tags-for-match
Check all git tags for a match. Scripts and illustration.

# Contents
- [check-git-tags-for-match](#check-git-tags-for-match)
- [Contents](#contents)
- [Analysis and Design](#analysis-and-design)
- [Scripts](#scripts)
- [Testing](#testing)
- [TODO](#todo)
- [Improvements](#improvements)

# Analysis and Design
## Why?
1) The exact logic or components therein can be useful in various automation / build & deploy / glue scenarios. 
2) Some learning of things I always forget and need to look-up.
3) Why not?
## HLRs
• Output whether a given git tag exists in a repository or not.  
• Implement validation checks and error handling.  
## NFRS
• A requirement means a test / tests.  
• Lightweight, fairly portable.  
• Good documentation.  
## Design
TODO

# Scripts
`scripts/`

## Prerequisites
```
# Download the script.
# Change directory to this (or any other) git repository.
cd check-git-tags-match/scripts/

# Ensure you can run the following:
# Expect tags output (if any) and 0 exit code.
git tag -l
echo $?

# Make executable so you can use (assumes script in the same dir).
chmod +x check_git_tags_for_match.sh
```

## Dependencies
* Requires git client installed.
* POSIXy environment.

## Main script
`check_git_tags_for_match.sh`  
This script can be used to check if a given git tag already exists in any git repository.  

### Outputs
**Exit code 0** - The search ran but that tag does not exist in the repository.   
**Exit code 3** - The search ran and found that the tag already exists in the repository.  
**Exit code 1** - A failure occured, likely because of input validation.  

### Usage
```
# Execute the script where <git-tag> is the tag you are searching for.
sh check_git_tags_for_match.sh <git-tag>

# Expect useful output. But use exit codes as defined above to make further decisions:
# See usage.sh for minimal automated usage implementation.
# And see the 'Testing' section for some specific examples.
```

## Alt Script
`check_git_tags_for_match_alt.sh`  
A minimal implementation which does (approximately) the same thing in 5 lines. But ofcourse, there are trade-offs...

# Testing

## Environment
This repository has been gerry-rigged as a test environment for the script. It has been set up with a load of dummy taggs which represent different "versions".

## List tags
GitHub Website > This Repository > Releases.  
GitHub Website > Branch dropdown > Tags tab.
```
# Clone repo, cd into repo, list # of tags.
git tags -l | wc -l
# output
10

# List tags.
git tags -l
# output
v0.1.0
v0.1.1
v0.1.2
v0.1.3
v0.1.4
v0.2.0
v0.3.0
v0.3.1
v0.3.2
v1.0.0
```

## Cases
*More test inputs to be exercised but only one / a few examples to be documented here.*  
### Functional
#### Positive
* A valid tag input not already on the repository returns exit code 0 and a useful message. ✅
```
$ sh check_git_tags_for_match.sh hello && echo $?
This tag does not already exist in this repository. Success.
0
$ sh check_git_tags_for_match.sh v2.0.0 && echo $?
This tag does not already exist in this repository. Success.
0
```
#### Negative 
* A valid tag input already on the repository returns exit code 3 and a useful message. ✅
```
$ sh check_git_tags_for_match.sh v0.1.0 ; echo $?
This tag already exists in this repository. Exiting.
3
$ sh check_git_tags_for_match.sh v1.0.0 ; echo $?
This tag already exists in this repository. Exiting.
3
```
* Running without an input argument is caught out with a useful message. ✅
```
$ sh check_git_tags_for_match.sh ; echo $?
This script requires an argument input to search for a match over the git tags. No valid argument found. Exiting.
1
```
* Running with a empty string input argument is caught out with a useful message. ✅
```
$ sh check_git_tags_for_match.sh "" ; echo $?
This script requires an argument input to search for a match over the git tags. No valid argument found. Exiting.
1
```
* Running with a whitespace string input argument is caught out with a useful message. ✅
```
$ sh check_git_tags_for_match.sh "      " ; echo $?
The input argument is not a valid git tag. See: https://git-scm.com/docs/git-check-ref-format. Exiting.
1
```
* Running with some invalid GitHub tag inputs are caught out with a useful message. ✅
```
$ sh check_git_tags_for_match.sh "hello." ; echo $?
The input argument is not a valid git tag. See: https://git-scm.com/docs/git-check-ref-format. Exiting.
1
$ sh check_git_tags_for_match.sh "[[" ; echo $?
The input argument is not a valid git tag. See: https://git-scm.com/docs/git-check-ref-format. Exiting.
1
$ sh check_git_tags_for_match.sh "hi\there" ; echo $?
The input argument is not a valid git tag. See: https://git-scm.com/docs/git-check-ref-format. Exiting.
1
$ sh check_git_tags_for_match.sh "   i   i  " ; echo $?
usage: git check-ref-format [--normalize] [<options>] <refname>
   or: git check-ref-format --branch <branchname-shorthand>
The input argument is not a valid git tag. See: https://git-scm.com/docs/git-check-ref-format. Exiting.
1
```
### Non-Functional
TODO

# TODO
* Complete design section on some decisions made to fulfill requirements.
* Add NFR test section and results.
* Analyse the short script version and state what you gain and lose from it.
* Little project write up.

# Improvements
* Help / Usage documentation inside the script.
* Ability to pass in location of the git project so that the runner does not need to be within the project directory to use the script: https://git-scm.com/docs/git#Documentation/git.txt---git-dirltpathgt.
* Use flags to pass in args more clearly.
* Automate the easily automatable tests.


