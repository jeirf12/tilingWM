#!/bin/bash
# Autor: { Fallen }

#Comando para crear un modulo para el framework laminas php
# Colores
purpleColour="\e[0;35m\033[1m"
greenColour="\e[0;32m\033[1m"
redColour="\e[0;31m\033[1m"
endColour="\033[0m\e[0m"

if [[ -d module ]]; then
  nameModule=$1
  nameModule=$(tr [A-Z] [a-z] <<< "$nameModule")
  nameModuleCapitalize=${nameModule^}
  folderBase=module/$nameModuleCapitalize
  folderSrc=$folderBase/src
  folderView=$folderBase/view/$nameModule/$nameModule
  mkdir -p $folderBase/config/
  mkdir -p $folderSrc/Controller/
  mkdir -p $folderSrc/Form/
  mkdir -p $folderSrc/Model/
  mkdir -p $folderView/
  echo "<?php" > $folderBase/config/module.config.php
  echo "<?php" > $folderSrc/Controller/$nameModuleCapitalizeController.php
  echo "<?php" > $folderSrc/Form/$nameModuleCapitalize.php
  echo "<?php" > $folderSrc/Model/$nameModuleCapitalizeTable.php
  echo "<?php" > $folderSrc/Module.php
  echo "" > $folderView/index.phtml
  echo "" > $folderView/add.phtml
  echo "" > $folderView/edit.phtml
  echo "" > $folderView/delete.phtml
  echo -e "${purpleColour}[*]${endColour}${greenColour} Modulo creado correctamente${endColour}"
else
  echo -e "${purpleColour}[*]${endColour}${redColour} No se puede crear el modulo, dirijase al directorio raiz del proyecto${endColour}"
fi
