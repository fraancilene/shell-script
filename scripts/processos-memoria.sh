#!/bin/bash

## se não houver um diretório chamado logs, ele será criado
if [ ! -d logs ] 
then
	mkdir logs
fi

processos_memoria(){
## filtrando os processos e pegando as linhas que contém apenas números
	processos=$(ps -e -o pid --sort -size | head -n 11 | grep [0-9])

	for pid in $processos
	do
		## pegando o nome dos processos
		nome_processo=$(ps -p $pid -o comm=)
		
		## -n informa ao comando echo para ele não ir para uma nova linha
		echo -n $(date +%F,%H:%M:%S,) >> logs/$nome_processo.log
		
		## pegando o tamanho da memória do processo
		tamanho_process=$(ps -p $pid -o size | grep [0-9])
		
		## trasnformando o valor da memória de kilobytes para megabytes
		echo "$(bc <<< "scale=2;tamanho_processo/1024")MB" >> logs/$nome_processo.log
	done
}

## verificando se os arquivos foram salvos com sucesso
processos_memoria
if [ $? -eq 0 ]
then
	echo "Arquivos salvos com sucesso!"
else
	echo "Houve um problema ao salvar os arquivos!"
fi
