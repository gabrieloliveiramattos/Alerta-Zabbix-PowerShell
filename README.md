# Alerta-Zabbix-PowerShell
Integração de ferramenta de monitoração(Zabbix) alertas com powershell

Exemplo em Zabbix:

Em alguns casos necessitamos agir imediatamente a fim de corrigir um alerta. Como por exemplo servidor indisponivel.
Criamos uma tarefa agenda com o script Alerta.ps1 na estação dos analistas. No Zabbix configuramos uma ação para que todo alerta que seja de servidor indisponivel, mande um .txt para as estações com o nome do servidor em questão.

Host:  Nome das estações

Type:  Custom Script

Execute on:  Zabbix Agent

Comands:  cmd /c echo {HOST.NAME} > C:\temp\host.txt && schtasks /run /tn Alerta


Caso algum alerta de servidor indisponivel aconteca o zabbix ira executar o comando criando o txt no local correto e chamando a tarefa agenda, executando o script responsavel por abrir o pop na tela onde sera informado o nome do Servidor.
