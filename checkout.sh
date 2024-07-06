#!/bin/bash
source gitColour.sh
source gitFunctions.sh
clear

if [ ${#1} -lt 1 ]; then
    listLocalBranches

    printf "\n\nSelect the Git branch to checkout or"
    printf "\n- ${green}${bold}B${clear} to create new local branch based on current branch "
    printf "\n- ${green}${bold}M${clear} to checkout Main branch "
    printf "\n- ${blue}${bold}X${clear} to cancel "
    printf "\n- Selection: "
    read brNumber
else
    if [[ $1 == "m" || $1 == "M" ]]; then
        brNumber=m
    else 
        brNumber=x
    fi
fi

LEN=${#brNumber}
if [ $LEN -lt 1 ]; then
    brNumber=X
fi

if [[ $brNumber == "X"  ||  $brNumber == "x" ]]; then 
    printf "\nCheckout branch canceled by user.\n"
    exit
elif [[ $brNumber == "M"  ||  $brNumber == "m" ]]; then 
    printf "\nChecking out the main branch.\n"
    git checkout main
    gitPullForce.sh
elif [[ $brNumber == "B"  ||  $brNumber == "b" ]]; then 
    createBranch.sh
else 
    printf "\nChecking out branch: ${brNumber} - ${arrBranch[$((brNumber-1))]}\n" 
    brName=${arrBranch[$((brNumber-1))]}
    brName=${brName##*()}
    brName=${brName%%*()}
    gitPullForce.sh
    git checkout $brName
    git status
fi
