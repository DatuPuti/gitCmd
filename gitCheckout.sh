#!/bin/bash
source gitColour.sh
source gitFunctions.sh
clear

# Check if a branch name is provided as a command-line argument
if [[ -n "$1" ]]; then
    brName="$1"
    printf "\nChecking out branch: ${brName}\n"

    # Verify the branch exists before switching
    if git branch --list "$brName" | grep -q "$brName"; then
        git switch "$brName" || { printf "Error: Failed to switch branch.\n"; exit 1; }
        gitPullForce.sh
        git status
    else
        printf "Error: Branch '${brName}' does not exist.\n"
        exit 1
    fi
else
    # No argument provided, proceed with interactive branch selection
    listLocalBranches "\n\nSelect the Git branch to checkout or"

    printf "\n- ${green}${bold}B${clear} to create a new local branch based on the current branch"
    printf "\n- ${green}${bold}M${clear} to checkout the main branch"
    printf "\n- ${blue}${bold}X${clear} to cancel"
    printf "\n- Selection: "
    read -r brNumber

    case "$brNumber" in
        [Xx])
            printf "\nCheckout branch canceled by user.\n"
            exit
            ;;
        [Mm])
            printf "\nChecking out the main branch.\n"
            git switch main || { printf "Error: Failed to switch branch.\n"; exit 1; }
            gitPullForce.sh
            ;;
        [Bb])
            createBranch.sh
            ;;
        *)
            # Validate input is a number and exists in arrBranch
            if [[ "$brNumber" =~ ^[0-9]+$ ]] && ((brNumber <= ${#arrBranch[@]})); then
                brName=${arrBranch[$((brNumber - 1))]}
                brName=${brName##*()}
                brName=${brName%%*()}

                printf "\nChecking out branch: ${brName}\n"
                git switch "$brName" || { printf "Error: Failed to switch branch.\n"; exit 1; }
                gitPullForce.sh
                git status
            else
                printf "Invalid selection. Please try again.\n"
                exit 1
            fi
            ;;
    esac
fi

