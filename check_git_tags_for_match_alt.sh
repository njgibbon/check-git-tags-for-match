#!/bin/bash
set -euxo pipefail
[ ! -z "$1" ]
git check-ref-format "refs/tags/$1"
[ -z "$(git tag -l $1)" ]
