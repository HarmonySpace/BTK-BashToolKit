#!/bin/bash

#funsiones de log
source ../config.sh

#funsiones comunes
function log_info (){
  STATE=${3}
  DATE=$(date +"%T")
  HOUR=$(date +"%D")

  if [[ ${1} = "info" ]]
  then
    TYPE=$(print_message key "INFO")
  elif [[ ${1} = "warning" ]]
  then
    TYPE=$(print_message warning "WARNING")
  elif [[ ${1} = "error" ]]
  then
    TYPE=$(print_message error "ERROR")
  fi

  echo "$DATE $HOUR $TYPE ${2}" >> $LOG

  if [[ "${3}" != "false" ]]
  then
    echo "$DATE $HOUR $TYPE ${2}"
  fi
}

#funsiones para el archivo log
function log_void (){
  echo "$1" >> $LOG
}

function log_clear (){
  echo "" > $LOG
}

function log_sep(){
  log_void ""
  log_void ""
  log_void ""
  log_void ""
  log_void $SEP
}
