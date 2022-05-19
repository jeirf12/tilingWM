#!/bin/bash

# Generador de archivos rpc distribuidos en carpetas
# servidor y cliente donde se almacena los stub, las plantillas
# y los archivos .c

# Argumentos--> ./generator.sh nameDirectory nameFile
# nameDirectory --> nombre del directorio a crear
# nameFile --> Directorio del archivo .x que genera los stub, platillas y archivos .c con su respectivo makefile

directory=$1
file=$2
nameFile=$(echo $file | tr -d '.x')

dirClient=$directory/cliente
dirServer=$directory/servidor

mkdir -p $dirClient
mkdir -p $dirServer

mv $file $directory

cd $directory
rpcgen $file

cp $nameFile* cliente/
rm cliente/${nameFile}_svc.c
cp $nameFile* servidor/
rm servidor/${nameFile}_clnt.c

pushd cliente/ > /dev/null 2>&1
rpcgen -Sc $file > cliente.c
rpcgen -Sm $file > makeC
popd > /dev/null 2>&1

pushd servidor/ > /dev/null 2>&1
rpcgen -Ss $file > servidor.c
rpcgen -Sm $file > makeS
popd > /dev/null 2>&1

rm $nameFile*
