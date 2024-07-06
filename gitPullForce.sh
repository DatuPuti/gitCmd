#!/bin/bash
source gitFunctions.sh

git fetch
git stash save $stashName
git reset --hard HEAD
git merge '@{u}'
git status