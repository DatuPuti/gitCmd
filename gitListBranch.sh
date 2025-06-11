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

case "$brNumber" in 
    [lL])
        listLocalBranches
        exit
        ;;
    [rR])
        listRemoteBranches
        exit
        ;;
    [aA])
        listLocalBranches
        listRemoteBranches
        exit
        ;;
    [cC])
        printf "\nCurrent branch is : ${green}"
        getCurrentBranch
        printf "${clear}"
        exit
        ;;
esac

