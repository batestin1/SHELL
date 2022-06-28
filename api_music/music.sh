#!/bin/bash
#utf-8
#####################################################################
#
# script name: music.sh
# created in: 06/23/22
# modified in: 15:08:38
#
# summary: list contents about the external disk
#                                               developed by: bates
#####################################################################
#variables
help=$1
if test $help = "--help"
then
    echo """################### HELP COMMANDS #########################################"
    echo "This script receives three enters:"
    echo "[1] - Name of group"
    echo "[2] - Name of music"
    echo "[3] - Directory of out"
    echo "#############################################################################"
else
#variables
    clear
    echo "#############################################################################"
    read -p "Band/Group: " BAND
    echo "#############################################################################"
    sleep 1
    clear
    echo "#############################################################################"
    read -p "Music: " MUSIC
    echo "#############################################################################"
    sleep 1
    clear
    BANDI=$(echo "$BAND" | sed 's/ /-/g')
    MUSICI=$(echo "$MUSIC" | sed 's/ /%20/g')
    MUSICA=$(echo "$MUSIC" | sed 's/ /-/g')
    URL="https://www.letras.mus.br/$BANDI/$MUSICI"
    if curl -s $URL > /dev/null 
    then
        echo "############################################################################="
        read -p "Directory of out: " DIR
        echo "############################################################################="
        sleep 1
        clear
        mkdir -p $DIR
        echo "################### $BAND-$MUSIC #######################################################" > $DIR/$BANDI-$MUSICA.txt
        curl -s -L $URL | grep 'cnt-letra p402_premium'  | sed "s/<[^>]*>/\n/g;s/Adicionar.*Criar//g" >> $DIR/$BANDI-$MUSICA.txt
        echo "##############################################################################################################################################"
        echo "The file $DIR/$BAND-$MUSIC.txt was created with success!"
        echo "##############################################################################################################################################"
    else
        echo "#######################################################################"
        echo "The file The $BAND or $MUSIC was not found!"
        echo "#######################################################################"
    
    fi
fi
