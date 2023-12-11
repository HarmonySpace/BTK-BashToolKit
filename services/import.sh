#!/bin/bash

#vars
SHOW_LOG=false

#functions
##try catch import
function try_catch_import (){
  i_log_sep
  if [[ "${1}" = true ]]
  then
    i_log_info info "${2} -> import successfuly" $SHOW_LOG
  else
    i_log_info error "${2} -> import failed" $SHOW_LOG
    i_log_info error "file do not imported" $SHOW_LOG
    exit 1
  fi
}
##try info
function i_log_info (){
  STATE=${3}
  DATE_i=$(date +"%T")
  HOUR_i=$(date +"%D")
  if [[ ${1} = "info" ]]
  then
    TYPE=$(print_key "INFO")
  elif [[ ${1} = "warning" ]]
  then
    TYPE=$(print_warning "WARNING")
  elif [[ ${1} = "error" ]]
  then
    TYPE=$(print_error "ERROR")
  fi
  echo "$DATE_i $HOUR_i $TYPE ${2}" >> $LOG
  if [[ "${3}" != "false" ]]
  then
    echo "$DATE_i $HOUR_i $TYPE ${2}"
  fi
}
##log separated
function i_log_sep(){
  log_void ""
  log_void ""
  log_void ""
  log_void ""
  log_void $SEP
}

# export default
export IMPORT_SERVICES_LOADED=true