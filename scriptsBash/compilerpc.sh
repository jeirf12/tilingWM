#!/bin/bash
# Autor: { Fallen }

# Compila archivos rpc con la arquitectura cliente-servidor
# para ejecutar el comando copie y pegue el archivo en la raiz del proyecto donde se encuentra
# los directorios servidor y cliente --> Este comando es un mediador o automatizador del comando make en la arquitectura rcp
# por tal razon puede utilizar las primitivas que haya definido en su archivo make
# example:  ./compilerpc.sh clean
#           ./compilerpc.sh run
#           ./compilerpc.sh

pushd servidor/ > /dev/null 2>&1
make -f makeS $1 > /dev/null 2>&1
rm -f *_clnt.c
popd > /dev/null 2>&1

pushd cliente/ > /dev/null 2>&1
make -f makeC $1 > /dev/null 2>&1
rm -f *_svc.c
popd > /dev/null 2>&1
