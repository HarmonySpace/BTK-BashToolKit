#!/bin/bash

# print confirm

## basic spin
function confirm_yn (){
  gum confirm --prompt.foreground="$CL1" --selected.foreground="$CL1"   --unselected.foreground="254" --affirmative="yes" --negative="no" --default "${1}" && echo "yes" || echo "no"
  return 0
}

# export default
export CONFIRM_SERVICES_LOADED=true