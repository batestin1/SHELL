#\bin\sh
                    #********************************************************************************#
                    #                                                                                #
                    #                                  нεℓℓσ,вαтεs!                                  #
                    #                                                                                #
                    #   filename: push.sh                                                             #
                    #   created: 2022-03-01 00:00                                                    #
                    #                                       by: Bates <https://github.com/batestin1> #
                    #********************************************************************************#



echo "VAMOS CRIAR SEU REPOSITÓRIO"
sleep 1
clear
cd $HOME
echo "NESTE MOMENTO, VOCÊ SE ENCONTRA AQUI $HOME"
sleep 1
echo "QUAL O NOME DO REPOSITÓRIO QUE DESEJA SUBIR? "
echo "SE ACASO SEU REPOSITÓRIO NÃO ESTEJA NESTA LOCALIZAÇÃO, FAVOR ESCREVER O NOME DO DIRETÓRIO COM '/'"
read dir
cd $HOME/$dir
sleep 1
clear
echo "PREPARANDO PARA SUBIR"
sleep 1
git init
sleep 1
git add .
clear
sleep 1
echo "TUDO PREPARADO! ESCREVA O SEU COMMIT: "
read com
sleep 1
git commit -m "$com"
clear
echo "AGORA DÊ O NOME DA SUA BRANCH: "
read bra
git branch -M $bra
sleep 1
clear
USER=`git config --global user.name`
repo=`basename $PWD`
git remote add origin https://github.com/$USER/$repo.git
sleep 1
git push -u origin $bra
echo "PRONTO SEU REPOSITORIO FOI CRIADO COM SUCESSO"