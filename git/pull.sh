#\bin\sh
                    #********************************************************************************#
                    #                                                                                #
                    #                                  нεℓℓσ,вαтεs!                                  #
                    #                                                                                #
                    #   filename: pull.sh                                                            #
                    #   created: 2022-03-01 00:00                                                    #
                    #                                       by: Bates <https://github.com/batestin1> #
                    #********************************************************************************#

echo "VAMOS ATUALIZAR O SEU REPOSITÓRIO"
sleep 1
clear
cd $HOME
echo "NESTE MOMENTO, VOCÊ SE ENCONTRA AQUI $HOME"
sleep 1
echo "QUAL O NOME DO DIRETÓRIO REMOTO QUE DESEJA ATUALIZAR? "
echo "SE ACASO ELE NÃO ESTEJA NESTA LOCALIZAÇÃO, FAVOR ESCREVER O NOME DO DIRETÓRIO COM '/'"
read dir
cd $HOME/$dir
sleep 1
echo "QUAL O REPOSITÓRIO NO GIT(JUNTO A SUA BRANCH) QUE VOCÊ DESEJA ATUALIZAR: "
read link
sleep 1
echo "REALIZANDO O PULL"
sleep 1
git pull $link
echo "PRONTO SEU REPOSITORIO FOI ATUALIZADO COM SUCESSO!"