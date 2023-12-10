#!/bin/bash

# watermark
function water (){
  print_key "$(cat $CONFIG_PATH/ascii.txt)"
  return 0
}

function credentials (){
  print_message "User name"
  print_key "$(sed -n '1p' $CRED_PATH)"
  print_message "Git Key"
  print_key "$(sed -n '2p' $CRED_PATH)"
}

# export default
export USER_SERVICES_LOADED=true