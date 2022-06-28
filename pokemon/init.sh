#!/bin/bash

#####################################################################
#
# script name: pokemon.sh
# created in: 06/27/22
# modified in: 21:45:11
#
# summary: battle pokemon
#                                               developed by: bates
#####################################################################

#variables on USER

if test init.sh
then
    echo "======================================================================="
    echo "choose your option"
    echo "[1] - about"
    echo "[2] - run"
    echo "[3] - exit"
    read -p "Answer: " ANSWER 
    if [ $ANSWER -eq 1 ]
    then
        echo "================================= ABOUT =========================================================="
        echo "This program simulates a pokemon battle against Dr. LIn Ux, a pokemon expert who loves challenges "
    elif [ $ANSWER -eq 2 ]
    then
        if test -f /usr/bin/jq
        then
            sh game.sh
        else
            sudo apt-get install jq -y
            sh game.sh

        fi
    elif [ $ANSWER -eq 3 ]
    then
        echo "Thank you and come back always!"
    else
        echo "Choose a valid option!"
    fi

else
    echo "Choose a valid option!"
fi