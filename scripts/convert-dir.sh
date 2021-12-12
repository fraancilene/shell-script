#!/bin/bash

## COLOCANDO O CÓDIGO DENTRO DE UMA FUNÇÃO
converte_imagem(){
	## ENTRANDO NO DIRETÓRIO DAS IMAGENS
	cd /home/francilene/Documentos/Shell/imagens-livros

	## VERIFICANDO SE HÁ UM DIRETÓRIO, SE NÃO HOUVER VAI CRIAR
	if [ ! -d png ]
	then
		mkdir png
	fi

	## VARREDURA DE TODOS OS ARQUIVOS COM A EXTENSÃO .JPEG
	for imagem in *.jpg
	do
		## REMOVENDO A EXTENSÃO .JPG - $() - executa o que está entre parenteses e salva na variavel
		## local cria uma variável que só pode ser acessada dentro da função
		local imagem_sem_extensao=$(ls $imagem | awk -F. '{ print $1 }')

		## CONVERTENDO A EXTENSÃO DA IMAGEM E SALVANDO NA PASTA PNG
		convert $imagem_sem_extensaou.jpg png/$imagem_sem_extensao.png
	done
}

## INVOCANDO A FUNÇÃO - ação só pode ser feita depois da função criada
## e se caso houver erro, direcione para um arquivo.txt
converte_imagem 2>erros_conversao.txt

## VERIFICANDO O STATUS DE SAÍDA
if [ $? -eq 0 ]
then 
	echo "Coversão realizada com sucesso!"
else 
	echo "Houve uma falha no processo!"
fi
