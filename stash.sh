#!/bin/bash
source gitColour.sh
source gitFunctions.sh
clear

# show whats in the most recent stash
# git stash show 
# show whats in the most recent stash and show difference
# git stash show -p
# show whats in the a specific stash
# git stash show stash@{0}
# show whats in the a specific stash and show difference
# git stash show -p stash@{0}

printf "\n${bold}Current saved stashes\n${clear}"
listSavedStashes

printf "${bold}\nAvailable actions for stash:\n${clear}"

arrOpts=("Restore (pop)" "Save" "Delete" "Delete All" "Just browsing, do nothing")
for i in "${!arrOpts[@]}"; do
	printf "$((i+1)). ${arrOpts[i]} \n"
done

printf "\n\nSelect action or ${blue}${bold}X${clear} to cancel: "
read brNumber

if [[ $brNumber == "X"  ||  $brNumber == "x" || $brNumber == 5 ]]; then 
    printf "\nStash command canceled by user.\n"
    exit
fi

LEN=${#brNumber}
if [ $LEN -lt 1 ]; then
	printf "\nNo selection made exiting script"
	exit
fi

if [ $brNumber == 1 ]; then # pop stash
	printf "\nSelect the stash to restore from list: "
	read popStash
	if [[ $popStash == "X"  ||  $popStash == "x" ]]; then 
		printf "\nStash restore canceled by user.\n"
		exit
	else
		git stash pop stash@{$((popStash-1))}
	fi
elif [ $brNumber == 2 ]; then  # stash current changes
	printf "\nEnter name for new stash: "
	read newStashName
	if [[ $newStashName == "X"  ||  $newStashName == "x" ]]; then 
		printf "\nStash save canceled by user.\n"
		exit
	else
		git stash save $newStashName
	fi
elif [ $brNumber == 3 ]; then # delete a specific
	printf "\nSelect the stash to delete from list: "
	read delStash
	if [[ $delStash == "X"  ||  $delStash == "x" ]]; then 
		printf "\nStash delete canceled by user.\n"
		exit
	else
		git stash drop stash@{$((delStash-1))}
	fi
elif [ $brNumber == 4 ]; then # delete all saved stashes
	git stash clear
elif [ $brNumber == 5 ]; then # exit without doing anything
    printf "\nStash command canceled by user.\n"
    exit
fi

