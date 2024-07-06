#!/bin/bash
source gitColour.sh
source gitFunctions.sh
clear

if [ ${#1} -lt 1 ]; then
    printf "Enter name of new branch or enter ${blue}${bold}X${clear} to cancel: "
    read newBranch
    printf "\nConfirm create new branch: ${newBranch} (Y/N) ? "
    read usrAnswer
else 
    newBranch=$1
    usrAnswer="Y"
fi

LEN=${#newBranch}
if [[ $newBranch == "X" || $newBranch == "x" || $LEN -lt 1 ]]; then
    printf "\nCreate new branch canceled by user.\n"
    exit
fi


if [[ $usrAnswer == "Y" || $usrAnswer == "y" ]]; then 
    printf "\nCreating new branch : ${green}${bold}${newBranch}${clear} \n" 
    gitPullForce.sh
    git checkout -b $newBranch
else
    printf "\nCreate new branch canceled by user.\n"
fi