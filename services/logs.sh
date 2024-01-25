#!/bin/bash

# write logs
## debuging log
function log_debug (){
  gum log --time kitchen --structured --level debug "${1}" --level.foreground $CL1 >& /dev/null
  return 0
}
## informative logs
function log_info (){
  gum log --time kitchen --structured --level info "${1}" --level.foreground $CL2 >& /dev/null
  return 0
}
## warning logs
function log_warning (){
  gum log --time kitchen --structured --level warn "${1}" --level.foreground $WR >& /dev/null
  return 0
}
## fatal log
function log_fatal (){
  gum log --time kitchen --structured --level fatal "${1}" --level.foreground $FT >& /dev/null
  return 0
}
## error logs
function log_error (){
  gum log --time kitchen --structured --level error "${1}" --level.foreground $ERR
  return 0
}
# # print logs
# function print_log (){
#   if [[ "${1}" != false ]]
#   then
#     echo "${2}"
#   fi
# }
# # void log
# function log_void (){
#   echo "${1}" >> $LOG
# }

# export default
export LOGS_SERVICES_LOADED=true
