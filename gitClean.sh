#!/bin/bash
source gitColour.sh
clear

#Run ‘git clean -n’ to see a dry run;
#Run ‘git clean -f’ to force untracked file deletion;
#Use ‘git clean -f -d’ to remove untracked directories;
#Use ‘git clean -f -x’ to remove untracked .gitignore files; and
#Add the -i switch to do an interactive ‘git clean’.

arrOpts=(
    "Force untracked file deletion ${red}(dry run)${clear}"
    "Remove untracked directories ${red}(dry run)${clear}"
    "Remove untracked .gitignore files ${red}(dry run)${clear}"
    "Force untracked file deletion ${ltyellow}(interactive)${clear}"
    "Remove untracked directories ${ltyellow}(interactive)${clear}"
    "Remove untracked .gitignore files ${ltyellow}(interactive)${clear}")
#"Do an interactive ‘git clean’")

for i in "${!arrOpts[@]}";
    do printf "$((i+1)). ${arrOpts[i]} \n"
done

printf "\n\nSelect from the list or enter ${blue}${bold}X${clear} to cancel : "
read brNumber

LEN=${#brNumber}
if [ $LEN -lt 1 ]; then 
    brNumber=1
fi

if [[ $brNumber == "X"  ||  $brNumber == "x" ]]; then 
    printf "\nGit clean canceled by user.\n"
elif [ $brNumber == 1 ]; then 
    git clean -i -f
elif [ $brNumber == 2 ]; then 
    git clean -n -i -f
elif [ $brNumber == 3 ]; then 
    git clean -i -f -d 
elif [ $brNumber == 4 ]; then 
    git clean -n -i -f -d 
elif [ $brNumber == 5 ]; then 
    git clean -i -f -x
elif [ $brNumber == 6 ]; then 
    git clean -n -i -f -x
fi