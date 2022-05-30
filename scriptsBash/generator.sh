#!/bin/bash
# Autor: { Fallen }

# Generador de archivos rpc distribuidos en carpetas
# servidor y cliente donde se almacena los stub, las plantillas
# y los archivos .c

# Argumentos--> ./generator.sh nameDirectory nameFile
# nameDirectory --> nombre del directorio a crear
# nameFile --> Directorio del archivo .x que genera los stub, platillas y archivos .c con su respectivo makefile
# directoryClient --> Nombre del directorio cliente especifico
# directoryServer --> Nombre del directorio del servidor especifico

directory=$1
file=$2
client=$3
server=$4
nameFile=$(echo $file | tr -d '.x')

dirClient=$directory/${client}
dirServer=$directory/${server}

mkdir -p $dirClient
mkdir -p $dirServer

mv $file $directory

cd $directory
rpcgen $file

cp $nameFile* ${client}/
rm ${client}/${nameFile}_svc.c
cp $nameFile* ${server}/
rm ${server}/${nameFile}_clnt.c

pushd ${client}/ > /dev/null 2>&1
if [[ ! -e servidor.c ]]; then
  rpcgen -Sc $file > cliente.c
  rpcgen -Sm $file > makeC
fi
popd > /dev/null 2>&1

pushd ${server}/ > /dev/null 2>&1
rpcgen -Ss $file > servidor.c
rpcgen -Sm $file > makeS
popd > /dev/null 2>&1

rm $nameFile*
