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
  echo -e "\n${purpleColour} [*]${endColour}${yellowColour} Uso: ./repoGit${endColour}"
  echo -e "\n\t${purpleColour} -m${endColour}${redColour} \"Message commit\"${endColour}${yellowColour}\t Especifica un mensaje para el commit${endColour}"
	echo -e "\t${purpleColour} -h${endColour}${yellowColour}\t\t\t Muestra este panel de ayuda${endColour}\n"
	tput cnorm; exit 0
}

# Verifica si existe una carpeta inicializada de git
function verifiedFolder(){
  tput civis;
  test -d .git/
  if [ "$(echo $?)" -eq "0" ]; then
    git update-index -q --refresh
    if ! git diff-index --quiet HEAD --; then
      number="$(echo $message | wc -m)"
      branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
      if [ "$number" -gt 5 ]; then
        git add . ; git commit -m "$message"; git push -u origin $branch
      else
        echo -e "\n${purpleColour}[*]${endColour}${yellowColour} Dígite un mensaje mayor a 5 caracteres${endColour}"
      fi;
    else
      echo -e "\n${purpleColour}[*]${endColour}${greenColour} No hay cambios pendientes para subir${endColour}"
    fi;
  else
    echo -e "\n${purpleColour}[*]${endColour}${redColour} Diríjase a un directorio válido${endColour}"
  fi;
}

# Funcion principal de ejecución
declare -i parameterCount=0; while getopts ":m:h" arg; do 
  case $arg in
    m) message=$OPTARG; let parameterCount+=1 ;;
    h) helpPanel;;
  esac
done
if [ $parameterCount -eq 0 ]; then
  helpPanel
else
  verifiedFolder
  tput cnorm
fi
