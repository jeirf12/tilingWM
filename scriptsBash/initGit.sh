#!/bin/bash
# Autor: { Fallen }

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
function ctrl_c(){
	echo -e "\n${purpleColour} [*]${endColour}${grayColour}Saliendo...${endColour}"
  sleep 2
	tput cnorm; exit 0
}

# Muestra las opciones del comando
function helpPanel(){
  echo -e "\n${purpleColour} [*]${endColour}${yellowColour} Uso: ./initGit${endColour}"
  echo -e "\n\t${purpleColour}-b${endColour}${redColour} \"nameBranch\"${endColour}${yellowColour}\t Especifica el nombre de la rama principal${endColour}"
	echo -e "\t${purpleColour}-r${endColour}${redColour}  urlRemote${endColour}${yellowColour}\t Conecta el proyecto con el repositorio remoto especificado \n\t\t\t Nota: Si no se especifica la opción -b deja el nombre de la rama por defecto${endColour}"
	echo -e "\t${purpleColour}-h${endColour}${yellowColour}\t\t Mostrar este panel de ayuda${endColour}\n"
	tput cnorm; exit 0
}

# Indica el proceso de inicializar el proyecto
function startProcess(){
  tput civis;
  flag=0
  if [ "$nameBranch" ]; then
    let flag+=1
  else 
    nameBranch="master"
    let flag+=1
  fi
  if [ "$urlRemote" ]; then
    let flag+=1
  fi
  if [ $flag -eq 2 ]; then
    echo -e "\n${purpleColour} [*]${endColour}${yellowColour} El git se esta inicializando...${endColour}"
    sleep 6
    git init > /dev/null 2>&1; git branch -M $nameBranch; git remote add origin $urlRemote
    echo -e "\n${purpleColour} [*]${endColour}${greenColour} Inicializó correctamente el repositorio${endColour}"
  else
    helpPanel
  fi
}

# Verifica si existe una carpeta inicializada de git
function verifiedFolder(){
  test -d .git/
  if [ "$(echo $?)" -eq "0" ]; then
    echo -e "\n ${purpleColour}[*]${endColour}${redColour} No se puede inicializar el git porque ya existe${endColour}"
    ctrl_c
  fi
}

# Funcion principal de ejecución
declare -i parameterCount=0; while getopts ":b:r:h" arg; do 
  case $arg in
    b) nameBranch=$OPTARG; let parameterCount+=1 ;;
    r) urlRemote=$OPTARG; let parameterCount+=1 ;;
    h) helpPanel ;;
  esac
done
if [ $parameterCount -eq 0 ]; then
  helpPanel
else
  verifiedFolder
  startProcess
  tput cnorm
fi
