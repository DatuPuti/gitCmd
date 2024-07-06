#!/bin/bash
source gitColour.sh
source gitFunctions.sh

clear

printf "\nCurrent branch is : ${green}"
getCurrentBranch
printf "${clear}"

git status
