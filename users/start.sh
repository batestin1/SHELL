#/bin/bash

#coding: utf-8
                    #********************************************************************************#
                    #                                                                                #
                    #                                  нεℓℓσ,вαтεs!                                  #
                    #                                                                                #
                    #   filename: start.py                                                           #
                    #   created: 2022-03-03 00:00                                                    #
                    #                                       by: Bates <https://github.com/batestin1> #
                    #********************************************************************************#

echo "CRIANDO USUARIOS LINUX"
sleep 3
clear
echo "Quantos registros deseja efetuar? "
read reg
sleep 3
clear
for ((i=0; i<$reg; i++));
do
    echo "INSIRA O REGISRO Nº $i:"
    echo "Nome completo"
    read nome_completo
    sleep 3
    clear
    exec=`python3 create_user.py $nome_completo`
    echo "REGISTRO EFETUADO COM SUCESSO!"
    sleep 3
done

sudo chmod 777 users.txt
sudo newusers users.txt
rm users.txt
cd ~
cd ../../home
sudo chmod o-rx /home/*
echo """
############################################
Todos usuarios foram cadastrados com sucesso!
############################################
"""
ls -l


