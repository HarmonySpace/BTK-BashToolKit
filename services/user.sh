#!/bin/bash

# watermark
function water (){
  print_key "$(cat $CONFIG_PATH/waters/ascii.txt)"
  return 0
}

#function water_dog (){
#  print_key "$(cat $CONFIG_PATH/waters/dog.txt)"
#  return 0
#}

function credentials (){
  USER_usr=$(search_in "$CONFIG_PREF" "${1}" ' ' 4)
  try_catch "take a <user> for account ${1}"
  KEY_usr=$(search_in "$CONFIG_PREF" "${1}" ' ' 5)
  try_catch "take a <git key> for account ${1}"
  print_divider
  print_message "User name"
  print_key "$USER_usr"
  print_message "Git Key"
  print_key "$KEY_usr"
  print_divider
  return 0
}

# export default
export USER_SERVICES_LOADED=true