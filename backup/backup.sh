#!/bin/bash

#####################################################################
#
# script name: backup.sh
# created in: 06/23/22
# modified in: 15:08:38
#
# summary: list contents about the external disk
#                                               developed by: bates
#####################################################################
#reading the parameters
DIR_1=$1 > /dev/null 2> /dev/null 0>/dev/null 
DIR_2=$2 > /dev/null 2> /dev/null 0>/dev/null  
NAMEFILE=$3 > /dev/null 2> /dev/null 0>/dev/null 



DATE=$(date +%D)
SIZE=$(df -h $DIR_1 | grep -v "Size" | cut -c17-21) > /dev/null 2> /dev/null 0>/dev/null 
USED=$(df -h $DIR_1 | grep -v "Size" | cut -c23-28) > /dev/null 2> /dev/null 0>/dev/null 
AVAIL=$(df -h $DIR_1 | grep -v "Size" | cut -c29-32) > /dev/null 2> /dev/null 0>/dev/null 

#first checking

if [ $# -eq 0 -o $# -gt 3 ]
then
    echo "===================================================="
    echo "You need to inform the correct parameters!"
    echo "===================================================="
    echo "For help type --help"
    echo "===================================================="
elif [ $1 = "--help" ]
then
    echo """=================== HELP COMMANDS ========================================"
    echo "This script receives three parameters:"
    echo "[1] - Input Directory"
    echo "[2] - Output Directory"
    echo "[3] - Name for txt file output"
    echo "============================================================================="
else
    if test ! -d $DIR_1 > /dev/null 2> /dev/null 0>/dev/null 
    then
        echo "The dir $DIR_1 is not right!" 
        echo "Please try to insert again!"
    else
        sudo apt-get update -y && sudo apt-get upgrade -y > /dev/null 2> /dev/null 0>/dev/null 
        sudo apt-install tree > /dev/null 2> /dev/null 0>/dev/null 
        clear
        mkdir -p $DIR_2 > /dev/null 2> /dev/null 0>/dev/null 
        echo "===================== TITLE: $NAMEFILE ========================================" > $DIR_2/$NAMEFILE.txt
        echo "========================================================================" >> $DIR_2/$NAMEFILE.txt
        echo "" >> $DIR_2/$NAMEFILE.txt
        echo "Backup Date: $DATE" >> $DIR_2/$NAMEFILE.txt
        echo "Size of Disk: $SIZE" >> $DIR_2/$NAMEFILE.txt
        echo "Used size of DISK: $USED" >> $DIR_2/$NAMEFILE.txt
        echo "Avail size: $AVAIL" >> $DIR_2/$NAMEFILE.txt
        echo "========================================================================" >> $DIR_2/$NAMEFILE.txt
        echo "" >> $DIR_2/$NAMEFILE.txt
        echo "===================== CONTENTS ========================================" >> $DIR_2/$NAMEFILE.txt
        echo "" >> $DIR_2/$NAMEFILE.txt

        tree $DIR_1 | sed '1 d' >> $DIR_2/$NAMEFILE.txt 
        ########################################################################################################################
        echo "=================================================================================================================="
        echo ""
        echo "The file $NAMEFILE.txt was created whit succefull on $DIR_2/$NAMEFILE.txt"
        echo ""
        echo "==================================================================================================================="
       
    fi
fi