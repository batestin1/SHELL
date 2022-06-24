#!/bin/bash

#####################################################################
#
# script name: help
# created in: 06/23/22
# modified in: 15:05:12
#
# summary: save summary and operators commands in txt file
#                                               developed by: bates
#####################################################################

#created a dir

if [ ! -d ~/Documents/commands ]
then
    mkdir -p ~/Documents/commands
    echo "Directory does not exist and was successfully created, status: $?"
    sleep 1
else
    echo "Directory already created, status: $?"
    sleep 1
fi


#start
echo "=========================================="
read -p "Insert the command the you like: " COMD 

#if test -f /usr/bin/$COMD || test -f /bin/$COMD || test -f /sbin/$COMD
if $COMD > /dev/null 2> /dev/null 0>/dev/null 
then
    echo "=========================== COMMAND $COMD  ===========================================" > ~/Documents/commands/$COMD.txt
    echo "" >> ~/Documents/commands/$COMD.txt
    echo "====================================================================================" >> ~/Documents/commands/$COMD.txt
    echo ""
    whatis $COMD >> ~/Documents/commands/$COMD.txt
    echo "====================================================================================" >> ~/Documents/commands/$COMD.txt
    $COMD --help >> ~/Documents/commands/$COMD.txt
    echo "" >> ~/Documents/commands/$COMD.txt
    man $COMD >> ~/Documents/commands/$COMD.txt
    echo "==================================================================================== "   
    echo "File $COMD.txt successfully created!"
    echo "==================================================================================== " 
else
    echo "==================================================================================== " 
    echo "Command $COMD not found!"
    echo "==================================================================================== " 
fi