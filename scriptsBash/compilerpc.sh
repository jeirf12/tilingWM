#!/bin/bash
# Autor: { Fallen }

# Compila archivos rpc con la arquitectura cliente-servidor
# para ejecutar el comando copie y pegue el archivo en la raiz del proyecto donde se encuentra
# los directorios servidor y cliente --> Este comando es un mediador o automatizador del comando make en la arquitectura rcp
# por tal razon puede utilizar las primitivas que haya definido en su archivo make

# Colores
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

trap ctrl_c INT

# Permite detener el proceso con las teclas control + c
function ctrl_c() {
  echo -e "\n${purpleColour} [*]${endColour}${grayColour}Saliendo...${endColour}"
  sleep 2
  exit 0
}

# Muestra las opciones del comando
function helpme() {
  echo -e "\n${purpleColour} #${endColour}${yellowColour} Uso: ./comp ${endColour}"
  echo -e "\n\t${purpleColour} -c${endColour}${yellowColour} \"Command specific\"${endColour}${redColour}\t Especifica un comando definido en el makefile${endColour}"
  echo -e "\n\t${purpleColour} -s${endColour}${yellowColour} \"name server specific\"${endColour}${redColour}\t Especifica un nombre del servidor a compilar${endColour}"
  echo -e "\n\t${purpleColour} -t${endColour}${yellowColour} \"name servers\"${endColour}${redColour}\t Especifica varios nombres de servidores a compilar${endColour}"
  echo -e "\n${purpleColour} Note:${endColour}${yellowColour} Al utilizar sin banderas, por defecto va a compilar un  en la carpeta cliente y carpeta servidor ./comp ${endColour}"
  exit 0
}

# Entra a una carpeta servidora especificada por parametro $1 y ejecuta el comando especificado en el parametro $2
# Nota: El comando especificado en el parametro $2 debe ser coincidente con los definidos en el archivo Makefile
function compServer() {
  pushd $1 > /dev/null 2>&1
  make -f makeS $2 > /dev/null 2>&1
  rm -f *_clnt.c
  popd > /dev/null 2>&1
}

# Entra a una carpeta cliente especificada por parametro $1 y ejecuta el comando especificado en el parametro $2
# Nota: El comando especificado en el parametro $2 debe ser coincidente con los definidos en el archivo Makefile
function compClient() {
  pushd $1 > /dev/null 2>&1
  make -f makeC $2 > /dev/null 2>&1
  rm -f *_svc.c
  popd > /dev/null 2>&1
}

# Compila por defecto dentro de una carpeta cliente y servidor especificados como tal y tambien recibe un parametro para la accion a hacer dentro de estas.
# Nota: El comando o accion especificado en el parametro $1 debe ser coincidente con los definidos en el archivo Makefile
function defaultCompiler() {
  client=cliente/
  server=servidor/
  action=$1
  compClient $client $action 
  compServer $server $action 
}

# Comienzo de la funcion principal
declare -i parameterCount=0; while getopts ":a:s:t:c:h" arg; do
  case $arg in
    a) commands=$OPTARG;;
    s) server=$OPTARG; let parameterCount+=1;;
    t) servers=$OPTARG; let parameterCount+=1;;
    c) client=$OPTARG; let parameterCount+=1;;
    h) helpme;;
  esac
done

if [ $parameterCount -eq 0 ]; then
  defaultCompiler $1
else
  if [ ! -z "$server" ]; then
    compServer $server/ $commands
  else
    shift "$(($OPTIND -1))"
    compServer $servers/ $commands
    for server in "$@"; do
      compServer $server/ $commands
    done
  fi
  if [ ! -z "$client" ]; then
    compClient $client/ $commands
  fi
fi
