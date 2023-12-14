#!/bin/bash

# print spin
## basic spin
#dont use
# function spin_command (){
#   gum spin --spinner dot --spinner.foreground="212" --title "$1" -- $2
#   return 0
# }

## time spin
function spin_time (){
  gum spin --spinner dot --spinner.foreground="$CL1" --title "$1" -- sleep $2
  return 0
}


# export default
export SPIN_SERVICES_LOADED=true