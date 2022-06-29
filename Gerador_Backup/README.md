<h1 align="center">
<img src="https://img.shields.io/static/v1?label=SHELL%20POR&message=MAYCON%20BATESTIN&color=7159c1&style=flat-square&logo=ghost"/>


<h3> <p align="center">SHELL - GENERATOR BACKUP </p> </h3>
<h3> <p align="center"> ================= </p> </h3>

>> <h3> Step I - HOW WORKS </h3>

<p> After downloading clone the repository run the file GeraBackupHome.sh </p>

<p> It will check on your system if there is a ~/Backup directory, if it does not exist, it will create one and will store every 7 days a backup of all your contents from the home/with three desirable parameters; source path, outgoing path, name for txt file.  </p>

>> <h3> Help command </h3>
<p> type: </p>

`sh GeraBackupHome.sh --ajuda`
<p> out </p>

```
#========================= COMANDO DE AJUDA ============================================================================#
# * Este programa gere um arquivo compactado de backup de todo o diretório home do usuário atual.                       #
# * Em caso de um backup já existir, ele automaticamente lhe pergunta se deseja sobreescrever ou cancelar o backup.     #
# * Os backups são realizados automaticamente a cada 7 dias                                                             #
# * Os arquivos de backup são de extensão 'tgz' e podem ser descompactados usando o tar                                 #
========================================================================================================================#
```
