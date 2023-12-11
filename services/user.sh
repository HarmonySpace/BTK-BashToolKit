#!/bin/bash

# watermark
function water (){
  print_key "$(cat $CONFIG_PATH/waters/ascii.txt)"
  return 0
}

function water_dog (){
  print_key "$(cat $CONFIG_PATH/waters/dog.txt)"
  return 0
}

function credentials (){
  print_message "User name"
  print_key "$(sed -n '1p' $CRED_DIR)"
  print_message "Git Key"
  print_key "$(sed -n '2p' $CRED_DIR)"
  return 0
}

# export default
export USER_SERVICES_LOADED=true