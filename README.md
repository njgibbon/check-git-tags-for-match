# check-git-tags-for-match
Check all git tags for a match. Scripts and illustration.

# check_git_tags_match.sh

## Description
This script can be used to check if a given git tag already exists in any git repository.

## Outputs
**Exit code 0** - The search ran but that tag does not exist in the repository.   
**Exit code 3** - The search ran and found that the tag already exists in the repository.  
**Exit code 1** - A failure occured, likely because of input validation.  

## Prerequisites
```
# Download the script.
# Change directory to this (or any other) git repository.
cd check-git-tags-match

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


## Usage
```
# Execute the script where <git-tag> is the tag you are searching for.
sh check_git_tags_for_match.sh <git-tag>

# Expect useful output. But use exit codes as defined above to make further decisions:
# See usage.sh for minimal automated usage implementation.
```

## Tests
TODO

## Design
TODO

# check_git_tags_match_alt.sh
A minimal implementation which does the same thing in 5 lines. But ofcourse, there are trade-offs...

# Guide
TODO

# Improvements
TODO


