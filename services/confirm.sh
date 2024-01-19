#!/bin/bash

# print confirm

## basic spin
function confirm_yn (){
  gum confirm --selected.foreground="$BG" --prompt.foreground="$CL1" --unselected.foreground="$CL1" --affirmative="yes" --negative="no" --default "${1}" && echo "yes" || echo "no"
  return 0
}

# export default
export CONFIRM_SERVICES_LOADED=true