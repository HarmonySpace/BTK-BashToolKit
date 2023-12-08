#!/bin/bash

# print choose
## choose one
function choose_one (){
  gum choose --cursor "> " --cursor.foreground $CL1 --item.foreground $FR --selected.foreground $CL1 "${@}"
  return 0
}

## custom choose one
function choose_one_custom (){
  gum choose --cursor="${2}" --cursor.foreground="${3}" --item.foreground="${4}" --selected.foreground="${5}" "${@}"
  return 0
}

# export default
export CHOOSE_SERVICES_LOADED=true