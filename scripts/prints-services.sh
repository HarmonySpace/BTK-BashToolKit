#!/bin/bash

function print_join (){
  echo "${1}" "${2}" "${3}"
}

function try_catch (){
  if [[ "$?" = 0 ]]
  then
    log_info info "${1} -> successfuly" $SLOGS
  else
    log_info error "${1} -> failed" $SERROR
    log_info error "$?" $SERROR
    exit 1
  fi
}

function print_message (){
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
    log_info error "opcion no valida" $SERROR
  fi
}

function print_chooseOne (){
  OP="${1}"
  if [[ $OP = "default" ]]
  then
    gum choose --cursor "> " --cursor.foreground $CL1 --item.foreground $FR --selected.foreground $CL1 "${2}" "${3}" "${4}" "${5}" "${6}" 
  elif [[ $OP = "custom" ]]
  then
    gum choose --cursor="${2}" --cursor.foreground="${3}" --item.foreground="${4}" --selected.foreground="${5}" "${6}" "${7}" "${8}" "${9}" "${10}"
  else
    log_info error "opcion no valida" $SERROR
  fi 
}

function print_input (){
  OP="${1}"
  if [[ $OP = "default" ]]
  then
    gum input --prompt "> " --cursor.mode "blink" --char-limit 255 --prompt.foreground "$CL1" --cursor.foreground "$CL1" --width 255 --placeholder "${2}"
  elif [[ $OP = "custom" ]]
  then
    PASS="${8}"
    if [[ $PASS = "pass" ]]
    then
      PASS="--password"
    else
      PASS=""
    fi
    gum input --prompt "${2}" --cursor.mode "${3}" --char-limit "${4}"  --prompt.foreground "${5}" --cursor.foreground "${6}" --width "${7}" --placeholder "${8}"f
  else
    log_info error "opcion no valida" $SERROR
  fi
}
