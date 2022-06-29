#!/bin/bash

#####################################################################
#
# script name: GeraBackupHome.sh
# created in: 06/29/22
# modified in: 09:14:41
#
# summary: gera um backup automatico para uma pasta chamada backup
#                                               developed by: bates
#####################################################################

#variables


DATE=$(date +%Y%m%d%H%m)
DEST=~/Backup
if [ $1 = "--ajuda" ] 2>/dev/null; then
    echo "#========================= COMANDO DE AJUDA ============================================================================#"
    echo "# * Este programa gere um arquivo compactado de backup de todo o diretório home do usuário atual.                       #"
    echo "# * Em caso de um backup já existir, ele automaticamente lhe pergunta se deseja sobreescrever ou cancelar o backup.     #"
    echo "# * Os backups são realizados automaticamente a cada 7 dias                                                             #"
    echo "# * Os arquivos de backup são de extensão 'tgz' e podem ser descompactados usando o tar                                 #"
    echo "========================================================================================================================#"
elif [ ! -d $DEST ];then
    clear
    echo "========================================================================================================================="
    sleep 1
    echo "Criado o diretório de backup"
    mkdir -p $DEST
    sleep 1
    echo "Diretório criado com sucesso"
    sleep 1
else
    clear
    echo "========================================================================================================================="
    sleep 1
    echo "Diretório já existente"
    LAST_DATE=$(find $DEST -ctime -7 -name backup_home\*tgz)
    if [ $LAST_DATE ]; then
        echo "Backup dos últimos 7 dias já existente"
        sleep 1
        read -p  "Deseja continuar mesmo assim ? (S/n):" OPT
        if [ "$OPT" = S -o "$OPT" = s -o "$OPT" = "" ]; then
            sleep 1
            echo "Iniciando um novo backup..."
        elif [ "$OPT" = n -o "$OPT" = N ]; then
            sleep 1
            echo "Backup Abortado"
            echo "========================================================================================================================="

            exit 1
        else
            sleep 1
            echo "Opção Inválida"
            echo "========================================================================================================================="

            exit 2
        fi
    else
        read -p  "Deseja realizar o backup ? (S/n): " OPT
        if [ "$OPT" = S -o "$OPT" = s -o "$OPT" = "" ]; then
            sleep 1
            echo "Iniciando um novo backup..."

        elif [ "$OPT" = n -o "$OPT" = N ]; then
            sleep 1
            echo "Backup abortado!"
            echo "========================================================================================================================="

            exit 3
        else
            sleep 1
            echo "Opção Inválida"
            exit 4
            echo "========================================================================================================================="

        fi

    fi
fi

clear
echo "##############################################################################################"
FILE_NAME="backup_home_$(date +%Y%m%d%H%M).tgz"
sleep 1
tar zcvpf $DEST/$FILE_NAME --absolute-names --exclude="$DEST" $HOME/* > /dev/null
clear
echo "========================================================================================================================="
echo "Backup realizado com sucesso"
echo "========================================================================================================================="
