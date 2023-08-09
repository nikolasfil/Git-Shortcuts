#!/bin/bash


gclone(){

if [[ $1 == 'git@github.com:'* ]]
then 
    git clone $1
    local var=$(trimmerPrefix "$1" "git@github.com:")    
else 
    git clone "git@github.com:$1"
fi

var=$(split_string "$1" "/");

if [[ $var == *'.git' ]]
then 
    var=$(trimmerSuffic "$var" ".git")
fi 
# echo $var
cd $var;
};




split_string() {
    local string="$1"
    local delimiter="$2"

    # Saving the current value of IFS
    local oldIFS=$IFS

    # Setting the delimiter
    IFS="$delimiter"

    # Splitting the string and reading into variables
    read -r discard secondPart <<< "$string"

    # Restoring the previous value of IFS
    IFS=$oldIFS

    # Returning the second part
    echo "$secondPart"
}


trimmerPrefix() {
    local string="$1"
    local prefix="$2"
    echo "${string#$prefix}";
}


trimmerSuffic(){
    local string="$1"
    local suffix="$2"
    echo "${string%$suffix}";

}


