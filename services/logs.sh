#!/bin/bash

# write logs
## informative logs
function log_info (){
  take_date
  TYPE_this=$(print_key "INFO")
  MESSAGE_this="$DATE $HOUR $TYPE_this ${1}"
  echo "$MESSAGE_this" >> $LOG
  print_log $SLOGS "$MESSAGE_this"
  return 0
}
## warning logs
function log_warning (){
  take_date
  TYPE_this=$(print_warning "WARNING")
  MESSAGE_this="$DATE $HOUR $TYPE_this ${1}"
  echo "$MESSAGE_this" >> $LOG
  print_log $SLOGS "$MESSAGE_this"
  return 0
}
## error logs
function log_error (){
  take_date
  TYPE_this=$(print_error "ERROR")
  MESSAGE_this="$DATE $HOUR $TYPE_this ${1}"
  echo "$MESSAGE_this" >> $LOG
  print_log $SLOGS "$MESSAGE_this"
  return 0
}
# print logs
function print_log (){
  if [[ "${1}" != false ]]
  then
    echo "${2}"
  fi
}
# void log
function log_void (){
  echo "${1}" >> $LOG
}

# export default
export LOGS_SERVICES_LOADED=true
