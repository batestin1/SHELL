#\bin\sh
                    #********************************************************************************#
                    #                                                                                #
                    #                                  нεℓℓσ,вαтεs!                                  #
                    #                                                                                #
                    #   filename: clone.sh                                                           #
                    #   created: 2022-03-01 00:00                                                    #
                    #                                       by: Bates <https://github.com/batestin1> #
                    #********************************************************************************#



echo "VAMOS CLONAR UM REPOSITÓRIO"
sleep 1
echo "COLE ABAIXO O LINK DO REPÓSITORIO QUE DESEJA CLONAR: "
read link
clear
echo "SE DESEJAR, ESCREVA UM NOME PARA RENOMEAR O PROJETO: "
read name
cd $HOME
sleep 1
clear
echo "VOCÊ ESTA NESTE ENDEREÇO: "
pwd
echo "DESEJA CLONAR AQUI MESMO OU EM UM NOVO DIRETÓRIO:"
echo "[1] - SIM, CLONE AQUI MESMO"
echo "[2] - JÁ TENHO UM DIRETÓRIO E DESEJO USA-LO!"
echo "[3] - NÃO, QUERO UM NOVO DIRETÓRIO"
read opc
sleep 1
clear
if [ $opc == 1 ]
then
    echo "VAMOS CLONAR AQUI ENTÂO!"
    sleep 1
    git clone $link $name
    clear
    echo "REPOSITÓRIO CLONADO COM SUCESSO!"
elif [ $opc == 2 ]
then
    echo "QUAL O NOME DO DIRETÓRIO QUE DESEJA USAR"
    echo "(LEMBRE-SE QUE VOCÊ ESTÁ NO LOCAL '$HOME')"
    echo "OBS: Em caso de ser mais de um caminho, escreva-o usando o '/', por exemplo: caminho1/caminho2/ .."
    read existDir
    sleep 1
    clear
    echo "CLONANDO O REPOSITÓRIO EM $HOME/$existDir/"
    git clone $link $HOME/$existDir
    clear
    sleep 1
    echo "REPOSITÓRIO CLONADO COM SUCESSO!"
else
    echo "QUAL O NOME DO DIRETÓRIO QUE DESEJA CRIAR:"
    echo "(LEMBRE-SE QUE VOCÊ ESTÁ NO LOCAL '$HOME')"
    read pasta
    mkdir -p $HOME/$pasta
    sleep 1
    clear
    echo "O CAMINHO $HOME/$pasta foi criado com sucesso"
    sleep 1
    clear
    echo "REALIZANDO O CLONE"
    sleep 1
    clear
    git clone $link $HOME/$pasta/$name
    clear
    echo "REPOSITÓRIO CRIADO COM SUCESSO!"
fi