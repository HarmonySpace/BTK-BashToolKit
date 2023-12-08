#!/bin/bash

# tester
## try carch structure
function try_catch (){
  if [[ "$?" = 0 ]]
  then
    log_info "${1} -> successfuly"
    return 0
  else
    log_error "${1} -> failed"
    log_error "$?"
    exit 1
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