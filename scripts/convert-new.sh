#!/bin/bash

converte_imagem(){
## conversão jpg para png
	local caminho_imagem=$1
	local imagem_sem_extensao=$(ls $caminho_imagem | awk -F. '{print $1}')
	convert $imagem_sem_extensao.jpg $imagem_sem_extensao.png

}

varrer_diretorio(){
	$1
	
	## entrando na pasta da variável arquivo
	cd $1

	## fazendo varredura de todo conteúdo do diretório
	for arquivo in *
	do
		local caminho_arquivo=$(find /home/francilene/Documentos/Shell/imagens-novos-livros -name $arquivo)
		
		#verificando se é um diretório (-d)
		if [ -d $caminho_arquivo ]
			then 
				varrer_diretorio $caminho_arquivo
				
			else
				# chamando a função
				converte_imagem $caminho_arquivo
		fi
	done
}

## chamando a função
varrer_diretorio /home/francilene/Documentos/Shell/imagens-novos-livros

if [ $? -eq 0 ]
then
	echo "Conversão realizada com sucesso!"
else 
	echo "Houve um problema na conversão!"
fi
	
	
	
	
