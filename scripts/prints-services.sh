#!/bin/bash

#funsiones de pintar en pantalla
source ../config.sh

##personalizados
function print_message (){
  #gum style --foreground $1 --border-foreground $2 --border $3 --align $4 --margin "$5" --padding "$6" "$7"
  OP="${1}"
  if [[ $OP = "body" ]]
  then
    gum style --foreground $FR --align left "${2}"
  elif [[ $OP = "key" ]]
  then
    gum style --foreground $CL1 --align center "${2}"
  elif [[ $OP = "warning" ]]
  then
    gum style --foreground $CL2 --align center "${2}"
  elif [[ $OP = "error" ]]
  then
    gum style --foreground $ERR --align center "${2}"
  elif [[ $OP = "custom" ]]
  then
    gum style --foreground "${2}" --border-foreground "${3}" --border "${4}" --align "${5}" --margin "${6}" --padding "${7}" "${8}"
  else
    log_info error "opcion no valida"
  fi

}

function print_join (){
  echo "${1}" "${2}" "${3}"
}

function print_chooseOne (){
  OP="${1}"
  if [[ $OP = "default" ]]
  then
    gum choose --cursor "> " --cursor.foreground $CL1 --item.foreground $FR --selected.foreground $CL1 ${2} ${3} ${4} ${5} ${6} 
  elif [[ $OP = "custom" ]]
  then
    gum choose --cursor="${2}" --cursor.foreground="${3}" --item.foreground="${4}" --selected.foreground="${5}" "${6}" "${7}" "${8}" "${9}" "${10}"
  else
    log_info error "opcion no valida"
  fi 
}

#predeterminados
