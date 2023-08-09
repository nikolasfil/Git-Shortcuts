#!/bin/bash

gall (){
    
    if [ $# -eq 0 ]
    then
        echo "No arguments supplied"
        exit 1
    fi
    
    message=""
    
    for arg in "$@"; do
        message+="$arg "
    done
    
    git add . && git commit -m "$message" && git push ;
    
}



gadd () {
    git add . ;
}



gadl () {
    git add -A
}



gco () {
    
    if [ $# -eq 0 ]
    then
        echo "No arguments supplied"
        exit 1
    fi
    
    message=""
    
    for arg in "$@"; do
        message+="$arg "
    done
    
    
    git commit -m "$message"
    
}



gps () {
    git push
}




gst () {
    git status;
}


gcdu(){
    if [[ $# -eq 0 ]]
    then
        echo "You need to specify the directory";
    else
        
        cd $1 || exit 1
        
        
        if [ -d .git ];
        then
            
            
            find . -type f -size +100M >> .gitignore;
            
            if [[ -n $(git status --porcelain) ]]; then
                message1="Repository has uncommitted changes. Please commit or stash your changes before updating."
                notify-send 'Git Update Status' "Initiating Adding Commiting and Pushing \n $1" -t 2000
                echo "$message1"
                datetime=$(date +"%Y-%m-%d %H:%M:%S")
                
                git add . ; git commit -m " back up -  $datetime " ;
                message_git="$(git push)"
                if $message_git
                then
                    notify-send 'Git Update Status' "Push was successful" -t 2500
                else
                    notify-send 'Git Update Status' "Push was NOT successful \n $message_git"
                fi
                exit 0
            fi
            
            # Fetch the latest changes from the remote repository
            git fetch
            
            # Check if the current branch is behind the remote tracking branch
            if [[ -n $(git status -uno | grep 'Your branch is behind') ]]; then
                message2="Repository is not up to date."
                notify-send 'Git Update Status' "$message2" -t 2000
                echo "$message2"
                exit 0
            fi
            
            message3='Repository is uptodate '
            notify-send 'Git Update Status' "$message3" -t 2000
            
            echo "$message3"
        else
            echo "No Git repository Found"
            notify-send 'Error' 'No Git Repository Found' -t 2000
        fi
    fi
}
