#!/bin/bash
# Autor: { Fallen }

# Compila archivos rpc con la arquitectura cliente-servidor
# Para ejecutar el comando copie y pegue el archivo en la raiz del proyecto donde se encuentra 
# los directorio servidor y cliente --> Este comando es un mediador del comando make
# por tal razon puede utilizar las primitivas que haya definido en su archivo make
# example: ./comp.sh clean
#          ./comp.sh run
#          ./comp.sh

pushd servidor/ > /dev/null 2>&1
make -f makeS $1 > /dev/null 2>&1
rm -f *_clnt.c
popd > /dev/null 2>&1

pushd cliente/ > /dev/null 2>&1
make -f makeC $1 > /dev/null 2>&1
rm -f *_svc.c
popd > /dev/null 2>&1
