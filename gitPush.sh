#!/bin/bash
source gitColour.sh
source gitFunctions.sh
clear

arrOpts=("Git Push Upstream" "Git Push New Upstream")

for i in "${!arrOpts[@]}"; do
    printf "$((i+1)). ${arrOpts[i]} \n"
done

printf "\n\nSelect option from list or ${blue}${bold}X${clear} to cancel : "
read brNumber

case $brNumber in
    [Xx])
        printf "\nPush branch canceled by user.\n"
        exit
        ;;
    "1")
        git push
        exit
        ;;
    "2")
        clear 
        listLocalBranches "\n\nSelect the Git branch to push creating upstream or ${blue}${bold}X${clear} to cancel: "
        read brNumber
    
        LEN=${#brNumber}
        if [ $LEN -lt 1 ]; then 
            brNumber=X
        fi

        if [[ $brNumber == "X"  ||  $brNumber == "x" ]]; then 
            printf "\nPush upstream branch canceled by user.\n"
            exit
        else
            printf "\nPushing upstream branch: ${brNumber} - ${arrBranch[$((brNumber-1))]}\n" 
            brName=${arrBranch[$((brNumber-1))]}

            brName=${brName/\* /''}
            brName=${brName##*()}
            brName=${brName%%*()}
            git push --set-upstream origin ${brName}
        fi
        ;;
esac