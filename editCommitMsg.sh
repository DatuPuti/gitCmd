#!/bin/bash
source gitColour.sh
source gitFunctions.sh
clear


printf "Commits will be displayed in your default text editor.\n"
printf "Replace pick with reword before each commit message you want to change.\n"
printf "${blue}Example:${clear}\n"

printf "\t${green}pick${clear} e499d89 Delete CNAME\n"
printf "\t${red}reword${clear} e499d89 Delete CNAME change\n"

printf "Enter number of commits to list or enter ${blue}${bold}X${clear} to cancel: "
read numCommits

LEN=${#numCommits}
if [[ $numCommits == "X" || $numCommits == "x" || $LEN -lt 1 ]]; then
    printf "Modify commit message cancelled by user.\n"
    exit
fi

git rebase -i HEAD~$numCommits
