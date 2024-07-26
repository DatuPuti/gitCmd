#!/bin/bash
source gitColour.sh
source gitFunctions.sh
clear

arrOpts=("[C]urrent" "[L]ocal" "[R]emote" "[B]oth Local and Remote")

if [ ${#1} -lt 1 ]; then
    for i in "${!arrOpts[@]}"; do
        printf "${arrOpts[i]} \n"
    done

    printf "\nCurrent branch is : ${green}"
    getCurrentBranch
    printf "${clear}"

    printf "\n\nSelect option from list or ${blue}${bold}X${clear} to cancel: "
    read brNumber
else
    brNumber=$1
fi

if [[ $brNumber == "l" || $brNumber == "L" ]]; then
    brNumber=1
elif [[ $brNumber == "r" || $brNumber == "R" ]]; then
    brNumber=2
elif [[ $brNumber == "b" || $brNumber == "B" ]]; then
    brNumber=3
elif [[ $brNumber == "c" || $brNumber == "c" ]]; then
    printf "\nCurrent branch is : ${green}"
    getCurrentBranch
    printf "${clear}"
else
        exit
fi

LEN=${#brNumber}
if [ $LEN -lt 1 ]; then 
    exit
fi

if [ $brNumber == 1 ]; then # show only local branches
    listLocalBranches
elif [ $brNumber == 2 ]; then # show only remote branches
    git branch -r
elif [ $brNumber == 3 ]; then # show local and remote branches
    git branch -a
fi
