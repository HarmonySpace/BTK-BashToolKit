#!/bin/bash

# print spin
## basic spin
#dont use
function spin_command (){
  gum spin --spinner dot --title "$1" -- $2
  return 0
}

## custom spin
function spin_time (){
  gum spin --spinner dot --title "$1" -- sleep $2
  return 0
}


# export default
export SPIN_SERVICES_LOADED=true