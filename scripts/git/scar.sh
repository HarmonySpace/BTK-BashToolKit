#!/bin/bash

# share the dir
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
## configuration import
source "$SCRIPT_DIR/../config.sh"

clear
water_dog
try_catch "print a dog draw"
print_key2 "WOOF WOOF... como te ayudo? ->"
CHOOSE_dog=$(choose_one "directory" "github")
try_catch "option selected"
if_null $CHOOSE_dog
print_message "Opción seleccionada"
print_user "$CHOOSE_dog"
if [[ "$CHOOSE_dog" = "directory" ]]; then
  CHOOSE_dog=$(choose_one "copy dir")
  try_catch "option selected"
  if_null $CHOOSE_dog
  print_message "Opcion seleccionada"
  print_user "$CHOOSE_dog"
  if [[ "$CHOOSE_dog" = "copy dir" ]]; then
    DIR_actual=$(pwd)
    print_message "Direcciòn actual"
    print_key "$DIR_actual"
    pwd | xclip -selection clipboard
    try_catch "dir copy"
  fi
elif [[ "$CHOOSE_dog" = "github" ]]; then
  CHOOSE_dog=$(choose_one "Mostrar credenciales")
  try_catch "option selected"
  if_null $CHOOSE_dog
  print_message "Opción seleccionada"
  print_user "$CHOOSE_dog"
  if [[ "$CHOOSE_dog" = "Mostrar credenciales" ]]
  then
    print_message "Mostrar las credenciales de ..."
    TEMP_dog=$(take_me_list "git_account" "$CONFIG_PREF" 4)
    try_catch "account search"
    if_null $TEMP_dog
    CHOOSE_dog=$(cat $TEMP | choose_one)
    try_catch "account selection"
    if_null $CHOOSE_dog
    credentials $CHOOSE_dog
    try_catch
  fi
fi
print_key2 "WOOF adios!"




