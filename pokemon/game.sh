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
clear

NUM=$(shuf -i 1-151 -n 1)
NUM_1=$(shuf -i 1-151 -n 1)
NUM_2=$(shuf -i 1-151 -n 1)
NUM_3=$(shuf -i 1-151 -n 1)
NAME_1=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_1 | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
NAME_2=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_2 | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
NAME_3=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_3 | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
POKEBOLA=$(shuf -i 1-5 -n 1)

echo "================================================================================================================================================"
sleep 1
echo "------------------------------------------------- WELCOME TO POKE WORLD ------------------------------------------------------------------------"
sleep 1
read -p "Say your name: " USER_NAME
sleep 1
echo "Hello $USER_NAME"
sleep 1
echo "I'm Dr. LIN UX, and I'd like to give you one of these three:"
sleep 1
echo "[1] - $NAME_1"
echo "[2] - $NAME_2"
echo "[3] - $NAME_3"
sleep 1
read -p "Choose one of these pokemons: " POKEMON_USER

if [ $POKEMON_USER -eq 1 ]; then
    echo "You choose the $NAME_1"
    LEVEL=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_1 | jq '.base_experience')
    LEVEL_ATTACK_1=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_1 | jq '.stats | .[] | .base_stat' | sed "4,7 d" | sed "1,2 d" | sed "s/\n//g")
    LEVEL_DEFENSE_1=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_1 | jq '.stats | .[] | .base_stat' | sed "2,7 d" | sed "2 d" | sed "2 d" | sed "s/\n//g")
    TYPE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_1 | jq '.types | .[] | .type | .name' | sed "s/\"//g" | sed "2 d" | tr a-z A-Z)
    ABILITY=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_1 | jq '.abilities | .[] | .ability | .name ' | sed 's/\"//g' | sed '2,10 d' | tr a-z A-Z)
    read -p "I would like to see the information from the $NAME_1: Y/n " OPT
    if [ $OPT = "Y" -o $OPT = 'y' ]; then
        clear
        echo "================================================================================================================================================"
        sleep 1
        echo "================================================= INFORMATIONS ================================================================================"
        sleep 1
        echo "NAME: $NAME_1"
        sleep 1
        echo "NUMBER ON POKEDESK: $NUM_1"
        sleep 1
        echo "TYPE: $TYPE"
        sleep 1
        echo "ABILITY: $ABILITY"
        sleep 1
        echo "LEVEL: $LEVEL hp"
        sleep 1
        echo "LEVEL OF ATTACK: $LEVEL_ATTACK_1"
        sleep 1
        echo "LEVEL OF DEFENSE: $LEVEL_DEFENSE_1"
        echo "================================================================================================================================================"
        sleep 1
        read -p "$USER_NAME, would you like a pokemon duel with me? Y/n " DUEL
        if [ $DUEL = 'Y' -o $DUEL = "y" ]; then
            clear
            LEVEL=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.base_experience')
            LEVEL_ATTACK=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.stats | .[] | .base_stat' | sed "4,7 d" | sed "1,2 d" | sed "s/\n//g")
            LEVEL_DEFENSE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.stats | .[] | .base_stat' | sed "2,7 d" | sed "2 d" | sed "2 d" | sed "s/\n//g")
            TYPE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.types | .[] | .type | .name' | sed "s/\"//g" | sed "2 d" | tr a-z A-Z)
            ABILITY=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.abilities | .[] | .ability | .name ' | sed 's/\"//g' | sed '2,10 d' | tr a-z A-Z)
            NAME=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
            echo "================================================================================================================================================"
            sleep 1
            echo "Cool, let's start then... I choose the $NAME"
            sleep 1
            echo "What you wanna do:"
            echo "[1] - Defense"
            echo "[2] - Attack"
            read -p "Answer: " FIGHT

            if [ $FIGHT -eq 1 ]; then
                if [ ! $LEVEL_DEFENSE_1 -lt $LEVEL_ATTACK ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose Attack "
                    sleep 1
                    echo "your defense is $LEVEL_DEFENSE_1"
                    sleep 1
                    echo "my attack is $LEVEL_ATTACK"
                    sleep 1
                    echo "So, you win!"
                elif [ ! $LEVEL_DEFENSE_1 -gt $LEVEL_ATTACK ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your defense is $LEVEL_ATTACK_1"
                    sleep 1
                    echo "my attack is $LEVEL_DEFENSE "
                    sleep 1
                    echo "So, I win!"
                else
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "You choose defense and I choose Attack "
                    sleep 1
                    echo "your defense is $LEVEL_ATTACK_1"
                    sleep 1
                    echo "my attack is $LEVEL_DEFENSE "
                    sleep 1
                    echo "Nobody won!"
                fi
            elif [ $FIGHT -eq 2 ]; then
                if [ ! $LEVEL_ATTACK_1 -lt $LEVEL_DEFENSE ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your attack is $LEVEL_ATTACK_1"
                    sleep 1
                    echo "my defense is $LEVEL_DEFENSE "
                    sleep 1
                    echo "So, you win!"
                elif [ ! $LEVEL_ATTACK_1 -gt $LEVEL_DEFENSE ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your attack is $LEVEL_ATTACK_1"
                    sleep 1
                    echo "my defense is $LEVEL_DEFENSE "
                    sleep 1
                    echo "So, I win!"
                else
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your attack is $LEVEL_ATTACK_1"
                    sleep 1
                    echo "my defense is $LEVEL_DEFENSE "
                    sleep 1
                    echo "Nobody won!"
                fi
            else
                echo "choose a valid option"
                echo "================================================================================================================================================"

            fi
        else
            echo "All right, thanks for playing!"
        fi

    else

        sleep 1
        echo "Then let's duel!"
        read -p "$USER_NAME, would you like a pokemon duel with me? Y/n " DUEL
        if [ $DUEL = 'Y' -o $DUEL = "y" ]; then
            clear
            LEVEL=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.base_experience')
            LEVEL_ATTACK=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.stats | .[] | .base_stat' | sed "4,7 d" | sed "1,2 d" | sed "s/\n//g")
            LEVEL_DEFENSE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.stats | .[] | .base_stat' | sed "2,7 d" | sed "2 d" | sed "2 d" | sed "s/\n//g")
            TYPE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.types | .[] | .type | .name' | sed "s/\"//g" | sed "2 d" | tr a-z A-Z)
            ABILITY=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.abilities | .[] | .ability | .name ' | sed 's/\"//g' | sed '2,10 d' | tr a-z A-Z)
            NAME=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
            echo "================================================================================================================================================"
            sleep 1
            echo "Cool, let's start then... I choose the $NAME"
            sleep 1
            echo "What you wanna do:"
            echo "[1] - Defense"
            echo "[2] - Attack"
            read -p "Answer: " FIGHT

            if [ $FIGHT -eq 1 ]; then
                if [ ! $LEVEL_DEFENSE_1 -lt $LEVEL_ATTACK ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose Attack "
                    sleep 1
                    echo "your defense is $LEVEL_DEFENSE_1"
                    sleep 1
                    echo "my attack is $LEVEL_ATTACK"
                    sleep 1
                    echo "So, you win!"
                elif [ ! $LEVEL_DEFENSE_1 -gt $LEVEL_ATTACK ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your defense is $LEVEL_ATTACK_1"
                    sleep 1
                    echo "my attack is $LEVEL_DEFENSE "
                    sleep 1
                    echo "So, I win!"
                else
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "You choose defense and I choose Attack "
                    sleep 1
                    echo "your defense is $LEVEL_ATTACK_1"
                    sleep 1
                    echo "my attack is $LEVEL_DEFENSE "
                    sleep 1
                    echo "Nobody won!"
                fi
            elif [ $FIGHT -eq 2 ]; then
                if [ ! $LEVEL_ATTACK_1 -lt $LEVEL_DEFENSE ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your attack is $LEVEL_ATTACK_1"
                    sleep 1
                    echo "my defense is $LEVEL_DEFENSE "
                    sleep 1
                    echo "So, you win!"
                elif [ ! $LEVEL_ATTACK_1 -gt $LEVEL_DEFENSE ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your attack is $LEVEL_ATTACK_1"
                    sleep 1
                    echo "my defense is $LEVEL_DEFENSE "
                    sleep 1
                    echo "So, I win!"
                else
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your attack is $LEVEL_ATTACK_1"
                    sleep 1
                    echo "my defense is $LEVEL_DEFENSE "
                    sleep 1
                    echo "Nobody won!"
                fi
            else
                echo "choose a valid option"
                echo "================================================================================================================================================"

            fi
        else
            echo "All right, thanks for playing!"
        fi

    fi

elif
    [ $POKEMON_USER -eq 2 ]
then
    echo "You choose the $NAME_2"
    LEVEL=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_2 | jq '.base_experience')
    LEVEL_ATTACK_2=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_2 | jq '.stats | .[] | .base_stat' | sed "4,7 d" | sed "1,2 d" | sed "s/\n//g")
    LEVEL_DEFENSE_2=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_2 | jq '.stats | .[] | .base_stat' | sed "2,7 d" | sed "2 d" | sed "2 d" | sed "s/\n//g")
    TYPE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_2 | jq '.types | .[] | .type | .name' | sed "s/\"//g" | sed "2 d" | tr a-z A-Z)
    ABILITY=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_2 | jq '.abilities | .[] | .ability | .name ' | sed 's/\"//g' | sed '2,10 d' | tr a-z A-Z)
    read -p "I would like to see the information from the $NAME_2: Y/n " OPT
    if [ $OPT = "Y" -o $OPT = 'y' ]; then
        clear
        echo "================================================================================================================================================"
        sleep 1
        echo "================================================= INFORMATIONS ================================================================================"
        sleep 1
        echo "NAME: $NAME_2"
        sleep 1
        echo "NUMBER ON POKEDESK: $NUM_2"
        sleep 1
        echo "TYPE: $TYPE"
        sleep 1
        echo "ABILITY: $ABILITY"
        sleep 1
        echo "LEVEL: $LEVEL hp"
        sleep 1
        echo "LEVEL OF ATTACK: $LEVEL_ATTACK_2"
        sleep 1
        echo "LEVEL OF DEFENSE: $LEVEL_DEFENSE_2"
        echo "================================================================================================================================================"
        read -p "$USER_NAME, would you like a pokemon duel with me? Y/n " DUEL
        if [ $DUEL = 'Y' -o $DUEL = "y" ]; then
            clear
            LEVEL=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.base_experience')
            LEVEL_ATTACK=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.stats | .[] | .base_stat' | sed "4,7 d" | sed "1,2 d" | sed "s/\n//g")
            LEVEL_DEFENSE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.stats | .[] | .base_stat' | sed "2,7 d" | sed "2 d" | sed "2 d" | sed "s/\n//g")
            TYPE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.types | .[] | .type | .name' | sed "s/\"//g" | sed "2 d" | tr a-z A-Z)
            ABILITY=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.abilities | .[] | .ability | .name ' | sed 's/\"//g' | sed '2,10 d' | tr a-z A-Z)
            NAME=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
            echo "================================================================================================================================================"
            sleep 1
            echo "Cool, let's start then... I choose the $NAME"
            sleep 1
            echo "What you wanna do:"
            echo "[1] - Defense"
            echo "[2] - Attack"
            read -p "Answer: " FIGHT

            if [ $FIGHT -eq 1 ]; then
                if [ ! $LEVEL_DEFENSE_2 -lt $LEVEL_ATTACK ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose Attack "
                    sleep 1
                    echo "your defense is $LEVEL_DEFENSE_2"
                    sleep 1
                    echo "my attack is $LEVEL_ATTACK"
                    sleep 1
                    echo "So, you win!"
                elif [ ! $LEVEL_DEFENSE_2 -gt $LEVEL_ATTACK ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your defense is $LEVEL_ATTACK_2"
                    sleep 1
                    echo "my attack is $LEVEL_DEFENSE "
                    sleep 1
                    echo "So, I win!"
                else
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "You choose defense and I choose Attack "
                    sleep 1
                    echo "your defense is $LEVEL_ATTACK_2"
                    sleep 1
                    echo "my attack is $LEVEL_DEFENSE "
                    sleep 1
                    echo "Nobody won!"
                fi
            elif [ $FIGHT -eq 2 ]; then
                if [ ! $LEVEL_ATTACK_2 -lt $LEVEL_DEFENSE ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your attack is $LEVEL_ATTACK_2"
                    sleep 1
                    echo "my defense is $LEVEL_DEFENSE "
                    sleep 1
                    echo "So, you win!"
                elif [ ! $LEVEL_ATTACK_2 -gt $LEVEL_DEFENSE ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your attack is $LEVEL_ATTACK_2"
                    sleep 1
                    echo "my defense is $LEVEL_DEFENSE "
                    sleep 1
                    echo "So, I win!"
                else
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your attack is $LEVEL_ATTACK_2"
                    sleep 1
                    echo "my defense is $LEVEL_DEFENSE "
                    sleep 1
                    echo "Nobody won!"
                fi
            else
                echo "choose a valid option"
                echo "================================================================================================================================================"

            fi
        else
            echo "All right, thanks for playing!"
        fi
    else
        sleep 1
        echo "Then let's duel!"
        read -p "$USER_NAME, would you like a pokemon duel with me? Y/n " DUEL
        if [ $DUEL = 'Y' -o $DUEL = "y" ]; then
            clear
            LEVEL=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.base_experience')
            LEVEL_ATTACK=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.stats | .[] | .base_stat' | sed "4,7 d" | sed "1,2 d" | sed "s/\n//g")
            LEVEL_DEFENSE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.stats | .[] | .base_stat' | sed "2,7 d" | sed "2 d" | sed "2 d" | sed "s/\n//g")
            TYPE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.types | .[] | .type | .name' | sed "s/\"//g" | sed "2 d" | tr a-z A-Z)
            ABILITY=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.abilities | .[] | .ability | .name ' | sed 's/\"//g' | sed '2,10 d' | tr a-z A-Z)
            NAME=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
            echo "================================================================================================================================================"
            sleep 1
            echo "Cool, let's start then... I choose the $NAME"
            sleep 1
            echo "What you wanna do:"
            echo "[1] - Defense"
            echo "[2] - Attack"
            read -p "Answer: " FIGHT

            if [ $FIGHT -eq 1 ]; then
                if [ ! $LEVEL_DEFENSE_2 -lt $LEVEL_ATTACK ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose Attack "
                    sleep 1
                    echo "your defense is $LEVEL_DEFENSE_2"
                    sleep 1
                    echo "my attack is $LEVEL_ATTACK"
                    sleep 1
                    echo "So, you win!"
                elif [ ! $LEVEL_DEFENSE_2 -gt $LEVEL_ATTACK ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your defense is $LEVEL_ATTACK_2"
                    sleep 1
                    echo "my attack is $LEVEL_DEFENSE "
                    sleep 1
                    echo "So, I win!"
                else
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "You choose defense and I choose Attack "
                    sleep 1
                    echo "your defense is $LEVEL_ATTACK_2"
                    sleep 1
                    echo "my attack is $LEVEL_DEFENSE "
                    sleep 1
                    echo "Nobody won!"
                fi
            elif [ $FIGHT -eq 2 ]; then
                if [ ! $LEVEL_ATTACK_2 -lt $LEVEL_DEFENSE ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your attack is $LEVEL_ATTACK_2"
                    sleep 1
                    echo "my defense is $LEVEL_DEFENSE "
                    sleep 1
                    echo "So, you win!"
                elif [ ! $LEVEL_ATTACK_2 -gt $LEVEL_DEFENSE ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your attack is $LEVEL_ATTACK_2"
                    sleep 1
                    echo "my defense is $LEVEL_DEFENSE "
                    sleep 1
                    echo "So, I win!"
                else
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your attack is $LEVEL_ATTACK_2"
                    sleep 1
                    echo "my defense is $LEVEL_DEFENSE "
                    sleep 1
                    echo "Nobody won!"
                fi
            else
                echo "choose a valid option"
                echo "================================================================================================================================================"

            fi
        else
            echo "All right, thanks for playing!"
        fi

    fi
elif [ $POKEMON_USER -eq 3 ]; then
    echo "You choose the $NAME_3"
    LEVEL=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_3 | jq '.base_experience')
    LEVEL_ATTACK_3=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_3 | jq '.stats | .[] | .base_stat' | sed "4,7 d" | sed "1,2 d" | sed "s/\n//g")
    LEVEL_DEFENSE_3=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_3 | jq '.stats | .[] | .base_stat' | sed "2,7 d" | sed "2 d" | sed "2 d" | sed "s/\n//g")
    TYPE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_3 | jq '.types | .[] | .type | .name' | sed "s/\"//g" | sed "2 d" | tr a-z A-Z)
    ABILITY=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM_3 | jq '.abilities | .[] | .ability | .name ' | sed 's/\"//g' | sed '2,10 d' | tr a-z A-Z)
    read -p "I would like to see the information from the $NAME_3: Y/n " OPT
    if [ $OPT = "Y" -o $OPT = 'y' ]; then
        clear
        echo "================================================================================================================================================"
        sleep 1
        echo "================================================= INFORMATIONS ================================================================================"
        sleep 1
        echo "NAME: $NAME_3"
        sleep 1
        echo "NUMBER ON POKEDESK: $NUM_3"
        sleep 1
        echo "TYPE: $TYPE"
        sleep 1
        echo "ABILITY: $ABILITY"
        sleep 1
        echo "LEVEL: $LEVEL hp"
        sleep 1
        echo "LEVEL OF ATTACK: $LEVEL_ATTACK_3"
        sleep 1
        echo "LEVEL OF DEFENSE: $LEVEL_DEFENSE_3"
        echo "================================================================================================================================================"
        read -p "$USER_NAME, would you like a pokemon duel with me? Y/n " DUEL
        if [ $DUEL = 'Y' -o $DUEL = "y" ]; then
            clear
            LEVEL=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.base_experience')
            LEVEL_ATTACK=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.stats | .[] | .base_stat' | sed "4,7 d" | sed "1,2 d" | sed "s/\n//g")
            LEVEL_DEFENSE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.stats | .[] | .base_stat' | sed "2,7 d" | sed "2 d" | sed "2 d" | sed "s/\n//g")
            TYPE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.types | .[] | .type | .name' | sed "s/\"//g" | sed "2 d" | tr a-z A-Z)
            ABILITY=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.abilities | .[] | .ability | .name ' | sed 's/\"//g' | sed '2,10 d' | tr a-z A-Z)
            NAME=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
            echo "================================================================================================================================================"
            sleep 1
            echo "Cool, let's start then... I choose the $NAME"
            sleep 1
            echo "What you wanna do:"
            echo "[1] - Defense"
            echo "[2] - Attack"
            read -p "Answer: " FIGHT

            if [ $FIGHT -eq 1 ]; then
                if [ ! $LEVEL_DEFENSE_3 -lt $LEVEL_ATTACK ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose Attack "
                    sleep 1
                    echo "your defense is $LEVEL_DEFENSE_3"
                    sleep 1
                    echo "my attack is $LEVEL_ATTACK"
                    sleep 1
                    echo "So, you win!"
                elif [ ! $LEVEL_DEFENSE_3 -gt $LEVEL_ATTACK ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your defense is $LEVEL_ATTACK_3"
                    sleep 1
                    echo "my attack is $LEVEL_DEFENSE "
                    sleep 1
                    echo "So, I win!"
                else
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "You choose defense and I choose Attack "
                    sleep 1
                    echo "your defense is $LEVEL_ATTACK_3"
                    sleep 1
                    echo "my attack is $LEVEL_DEFENSE "
                    sleep 1
                    echo "Nobody won!"
                fi
            elif [ $FIGHT -eq 2 ]; then
                if [ ! $LEVEL_ATTACK_3 -lt $LEVEL_DEFENSE ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your attack is $LEVEL_ATTACK_1"
                    sleep 1
                    echo "my defense is $LEVEL_DEFENSE "
                    sleep 1
                    echo "So, you win!"
                elif [ ! $LEVEL_ATTACK_3 -gt $LEVEL_DEFENSE ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your attack is $LEVEL_ATTACK_3"
                    sleep 1
                    echo "my defense is $LEVEL_DEFENSE "
                    sleep 1
                    echo "So, I win!"
                else
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your attack is $LEVEL_ATTACK_3"
                    sleep 1
                    echo "my defense is $LEVEL_DEFENSE "
                    sleep 1
                    echo "Nobody won!"
                fi
            else
                echo "choose a valid option"
                echo "================================================================================================================================================"

            fi
        else
            echo "All right, thanks for playing!"
        fi
    else
        sleep 1
        echo "Then let's duel!"
        read -p "$USER_NAME, would you like a pokemon duel with me? Y/n " DUEL
        if [ $DUEL = 'Y' -o $DUEL = "y" ]; then
            clear
            LEVEL=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.base_experience')
            LEVEL_ATTACK=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.stats | .[] | .base_stat' | sed "4,7 d" | sed "1,2 d" | sed "s/\n//g")
            LEVEL_DEFENSE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.stats | .[] | .base_stat' | sed "2,7 d" | sed "2 d" | sed "2 d" | sed "s/\n//g")
            TYPE=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.types | .[] | .type | .name' | sed "s/\"//g" | sed "2 d" | tr a-z A-Z)
            ABILITY=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq '.abilities | .[] | .ability | .name ' | sed 's/\"//g' | sed '2,10 d' | tr a-z A-Z)
            NAME=$(curl -s -L https://pokeapi.co/api/v2/pokemon/$NUM | jq ' .forms | .[] | .name ' | sed 's/\"//g' | tr a-z A-Z)
            echo "================================================================================================================================================"
            sleep 1
            echo "Cool, let's start then... I choose the $NAME"
            sleep 1
            echo "What you wanna do:"
            echo "[1] - Defense"
            echo "[2] - Attack"
            read -p "Answer: " FIGHT

            if [ $FIGHT -eq 1 ]; then
                if [ ! $LEVEL_DEFENSE_3 -lt $LEVEL_ATTACK ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose Attack "
                    sleep 1
                    echo "your defense is $LEVEL_DEFENSE_1"
                    sleep 1
                    echo "my attack is $LEVEL_ATTACK"
                    sleep 1
                    echo "So, you win!"
                elif [ ! $LEVEL_DEFENSE_3 -gt $LEVEL_ATTACK ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your defense is $LEVEL_ATTACK_3"
                    sleep 1
                    echo "my attack is $LEVEL_DEFENSE "
                    sleep 1
                    echo "So, I win!"
                else
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "You choose defense and I choose Attack "
                    sleep 1
                    echo "your defense is $LEVEL_ATTACK_3"
                    sleep 1
                    echo "my attack is $LEVEL_DEFENSE "
                    sleep 1
                    echo "Nobody won!"
                fi
            elif [ $FIGHT -eq 2 ]; then
                if [ ! $LEVEL_ATTACK_3 -lt $LEVEL_DEFENSE ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your attack is $LEVEL_ATTACK_3"
                    sleep 1
                    echo "my defense is $LEVEL_DEFENSE "
                    sleep 1
                    echo "So, you win!"
                elif [ ! $LEVEL_ATTACK_3 -gt $LEVEL_DEFENSE ]; then
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your attack is $LEVEL_ATTACK_3"
                    sleep 1
                    echo "my defense is $LEVEL_DEFENSE "
                    sleep 1
                    echo "So, I win!"
                else
                    clear
                    sleep 1
                    echo "================================================================================================================================================"
                    sleep 1
                    echo "================================================ BATTLE ========================================================================================"
                    sleep 1
                    echo "You choose defense and I choose attack "
                    sleep 1
                    echo "your attack is $LEVEL_ATTACK_3"
                    sleep 1
                    echo "my defense is $LEVEL_DEFENSE "
                    sleep 1
                    echo "Nobody won!"
                fi
            else
                echo "choose a valid option"
                echo "================================================================================================================================================"

            fi
        else
            echo "All right, thanks for playing!"
        fi

    fi
else
    echo "You have not chosen any of the options given, please try again"
fi

