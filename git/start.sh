#\bin\sh
                    #********************************************************************************#
                    #                                                                                #
                    #                                  нεℓℓσ,вαтεs!                                  #
                    #                                                                                #
                    #   filename: git.sh                                                             #
                    #   created: 2022-03-01 00:00                                                    #
                    #                                       by: Bates <https://github.com/batestin1> #
                    #********************************************************************************#


echo """O QUE DESEJA FAZER NO GITHUB?
[- NO MOMENTO TEMOS APENAS ESTAS OPÇÕES -]
[1] - CLONAR REPOSITÓRIO
[2] - PUSH 
[3] - PULL"""
read opc
clear
if [ $opc == 1 ]
then
   bash clone.sh
elif [ $opc == 2 ]
then
    bash push.sh
elif [ $opc == 3 ]
then
    bash pull.sh
else
    echo "VOCÊ ENTROU COM UM VALOR ERRADOR! POR FAVOR, TENTE NOVAMENTE!"
fi
    
