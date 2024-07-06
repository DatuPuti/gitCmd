#!/bin/bash
source gitColour.sh
source gitFunctions.sh
clear

# rename current branch
#git branch -m $1

# rename any branch $1 == <oldname>, $2 == <newname>
# git branch -m $1 $2

if [ ${#1} -gt 1 ]; then
    newBranch=$1
fi

currBranch=$(getCurrentBranch)
LEN=${#newBranch}

if [[ $newBranch == "X" || $newBranch == "x" || $LEN -lt 1 ]]; then
    printf "Enter new name for current branch (${green}${currBranch}${clear}) or enter ${blue}${bold}X${clear} to cancel: "
    read newBranch
fi

LEN=${#newBranch}
if [[ $newBranch == "X" || $newBranch == "x" || $LEN -lt 1 ]]; then
    exit
else
    printf "\nRenaming current branch from ${green}${currBranch}${clear} to ${yellow}${newBranch}${clear}\n"
    git branch -m $newBranch
fi