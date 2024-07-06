#!/bin/bash
source gitColour.sh
source gitFunctions.sh
clear

listLocalBranches "\nSelect local branch to delete or ${blue}${bold}X${clear} to cancel: "
read brNumber
brName=${arrBranch[$((brNumber-1))]}
brName=${brName##*()}
brName=${brName%%*()}

if [[ $brNumber == "X"  ||  $brNumber == "x" ]]; then 
    printf "\nDelete local branch canceled by user.\n"
    exit
fi 

printf "\n"
arrOpts=(
    "Delete ${green}${brName}${clear} only if changes have been pushed"
    "${red}${bold}Force${clear} delete of ${green}${brName}${clear}"
)


for i in "${!arrOpts[@]}";
    do printf "$((i+1)). ${arrOpts[i]} \n"
done

printf "\nSelect delete option or enter ${blue}${bold}X${clear} to cancel : "
read delOption

LEN=${#delOption}
if [ $LEN -lt 1 ]; then 
    delOption="X"
fi

if [[ $delOption == "X"  ||  $delOption == "x" ]]; then 
    printf "\nDelete local branch canceled by user.\n"
    exit
elif [ $delOption == 1 ]; then 
    printf "${yellow}Delete if pushed:${clear} "
    printf "${red}${bold}"
    git branch -d ${brName}
    printf "${clear}"
elif [ $delOption == 2 ]; then 
    printf "${red}${bold}Force delete:${clear} "
    git branch -D ${brName}
fi