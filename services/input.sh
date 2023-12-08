#!/bin/bash

# print input
## input text
function input_text (){
  gum input --prompt "> " --cursor.mode "blink" --char-limit 255 --prompt.foreground "$CL1" --cursor.foreground "$CL1" --width 255 --placeholder "${1}"
  return 0
}

## custom input text
function input_text_custom (){
  PASS="${8}"
  if [[ $PASS = "pass" ]]
  then
    PASS="--password"
  else
    PASS=""
  fi
  gum input "$PASS" --prompt "${1}" --cursor.mode "${2}" --char-limit "${3}"  --prompt.foreground "${4}" --cursor.foreground "${5}" --width "${6}" --placeholder "${7}" 
  return 0
}

# export default
export INPUT_SERVICES_LOADED=true