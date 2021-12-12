## informando o interpretador do script
#!/bin/bash

## CONSTANTE
CAMINHO_IMAGENS=/home/francilene/Documentos/Shell/imagens-livros

## convertendo arquivo .jpg em .png
## $1 - informando que vai pegar o conteúdo de um parametro
## $@ - receber parametros do usuário
for imagem in $@
do
    convert $CAMINHO_IMAGENS/$imagem.jpg $CAMINHO_IMAGENS/$imagem.png
done