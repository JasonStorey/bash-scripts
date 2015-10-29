#!/bin/bash -

TYPE_OF_PRODGE=${1:-"npm"}
NAME_OF_PRODGE=$2

if [[ $# -eq 0 || -z "$NAME_OF_PRODGE" ]]; then
    printf "Usage: generate-project.sh [TYPE_OF_PRODGE] [NAME_OF_PRODGE] \n"
    exit 1
fi

function generateNpmProdge() {
    mkdir $NAME_OF_PRODGE && cd $NAME_OF_PRODGE
    npm init -y
}

if [ $TYPE_OF_PRODGE = "npm" ]; then
    printf "Generating project type : %s\n" $TYPE_OF_PRODGE
    generateNpmProdge
else
    printf "Unsupported project type : %s\n" $TYPE_OF_PRODGE
    exit 1    
fi

