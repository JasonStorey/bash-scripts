#!/bin/bash -

DIR_TO_LIST=${1:-"."}

echo $DIR_TO_LIST

du -ks ${DIR_TO_LIST}/* | sort -n

