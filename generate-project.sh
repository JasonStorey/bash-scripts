#!/bin/bash -

TYPE_OF_PRODGE=${1:-"npm"}
NAME_OF_PRODGE=$2

if [[ $# -eq 0 || -z "$NAME_OF_PRODGE" ]]; then
    printf "Usage: generate-project.sh [TYPE_OF_PRODGE] [NAME_OF_PRODGE] \n"
    exit 1
fi

function generateNpmProdge() {
    mkdir $NAME_OF_PRODGE &&
    sed "s/%%PROJECT_NAME%%/${NAME_OF_PRODGE}/g;
         s/%%PROJECT_VERSION%%/0.1.0/g;
         s/%%PROJECT_DESCRIPTION%%/A new and wonderful project/g;
         s/%%LIB_NAME%%/${NAME_OF_PRODGE}/g" ~/projects/bash-scripts/package-template.json > ./${NAME_OF_PRODGE}/package.json

    if [ $? -eq 0 ]; then
        cd $NAME_OF_PRODGE
        npm init -y
        # sed -i '' 's/"scripts": {/& \'$'\n    "clean": "mkdir -p dist",/' package.json
    fi
}

if [ $TYPE_OF_PRODGE = "npm" ]; then
    printf "Generating project type : %s\n" $TYPE_OF_PRODGE
    generateNpmProdge
else
    printf "Unsupported project type : %s\n" $TYPE_OF_PRODGE
    exit 1    
fi

