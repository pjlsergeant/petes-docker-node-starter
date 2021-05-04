#!/bin/ash

if [ $# -eq 0 ]
then
    npm start
else
    npm "$@"
fi
