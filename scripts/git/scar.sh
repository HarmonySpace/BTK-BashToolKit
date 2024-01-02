#!/bin/bash

# share the dir
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
## configuration import
source "$SCRIPT_DIR/../config.sh"

init_temp
clear
water_dog
try_catch "print a dog draw"
temp1=$(create_temp)
print_key "WOOF WOOF... como te ayudo? ->"
put_in $temp1 "$(echo option_selected = $(choose_one "directory" "github"))"
if_null "$(search_in $temp1 "option_selected" = 2)"
print_message "Opción seleccionada"
print_key "$(search_in $temp1 "option_selected" = 2)"
if [[ $(search_in $temp1 "option_selected" = 2) =~ "directory" ]]; then
  remove_line_in $temp1 "option_selected"
  print_message "Opción para \"directorio\""
  add_in $temp1 "$(echo option_selected = $(choose_one "copiar directorio"))"
  if_null "$(search_in $temp1 "option_selected" = 2)"
  print_key "$(search_in $temp1 "option_selected" = 2)"
  if [[ $(search_in $temp1 "option_selected" = 2) =~ "copiar directorio" ]]; then
    add_in $temp1 "$(echo actual_dir = $(pwd))"
    if_null "$(search_in $temp1 "actual_dir" = 2)"
    print_message "Dirección actual"
    print_key "$(search_in $temp1 "actual_dir" = 2)"
    search_in $temp1 "actual_dir" = 2 | xclip -selection clipboard
    try_catch "copy dir"
  fi
elif [[ $(search_in $temp1 "option_selected" = 2) =~ "github" ]]; then
  remove_line_in $temp1 "option_selected"
  print_message "Opción para \"github\""
  add_in $temp1 "$(echo option_selected = $(choose_one "mostrar credenciales"))"
  if_null "$(search_in $temp1 "option_selected" = 2)"
  print_key "$(search_in $temp1 "option_selected" = 2)"
  if [[ $(search_in $temp1 "option_selected" = 2) =~ "mostrar credenciales" ]]; then
    print_message "Credenciales de la cuenta ..."
    list_in $temp1 "git_account" $CONFIG_PREF 4 ' ' accounts
    if_null "$(search_list_in "accounts" $temp1 =)"
    add_in $temp1 "$(echo account_name = $(search_list_in "accounts" $temp1 = | choose_one))"
    if_null "$(search_list_in "accounts" $temp1 =)"
    print_key "$(search_in $temp1 "account_name" = 2)"
    credentials "$(search_in $temp1 "account_name" = 2)"
  fi
else
  print_error "Opción no válida"
fi
print_file "$(cat $temp1)"
delete_temp
print_key "WOOF adios!"
