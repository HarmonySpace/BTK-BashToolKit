#!/bin/bash

# tester
## try carch structure
function try_catch (){
  if [[ "$?" = 0 ]]
  then
    log_debug "${1} successfuly"
    return 0
  else
    log_error "${1} failed"
    log_error "$?"
    exit 1
  fi
}
## if null
function if_null () {
  log_debug "checking if argument is null"
  if [[ "${1}" = "" ]]; then
    log_error "argument is null"
    print_error "Volor vacio"
    exit 1
  else
    log_debug "argument is not null"
  fi
}
# system
## take a actual date
function take_date (){
  export DATE=$(date +"%T")
  export HOUR=$(date +"%D")
}

# export default
export SYSTEM_SERVICES_LOADED=true