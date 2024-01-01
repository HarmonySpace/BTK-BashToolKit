#!/bin/bash

# share the dir
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
## configuration import
source "$SCRIPT_DIR/../config.sh"

init_temp
print_start "git change account"
temp1=$(create_temp)
try_catch "create one temp"
put_in $temp1 "$(echo actual_account = $(git config --get user.name))"
try_catch "get an actual user"
print_message "Cuenta configurada"
print_key "$(search_in $temp1 "actual_account" 3)"
add_in $temp1 "$(echo confirm_change = $(confirm_yn '¿Desea cambiar de cuenta?'))"
try_catch "confirm a changes"
if_null $(search_in $temp1 "confirm_change" 3)
print_message "¿Desea cambiar de cuenta?"
print_key "$(search_in $temp1 "confirm_change" 3)"
if [[ $(search_in $temp1 "confirm_change" 3) =~ "yes" ]]; then
  add_in $temp1 "$(list_in $temp1 "git_account" $CONFIG_PREF 4 accounts)"
  try_catch "get all accounts"
  if_null $(search_in $temp1 "account" 3)
  print_message "Cuentas encontradas"
  print_key "$(search_list_in "accounts" $temp1)"
  remove_in $temp1 "$(search_in $temp1 "actual_account" 3)" "$(search_list_in "accounts" $temp1)" "valid_accounts"
  try_catch "remove actual account"
  if_null $(search_in $temp1 "valid_accounts" 3)
  print_message "Cuenta a cambiar"
  print_warning "No se permite cambiar a la misma cuenta"
  add_in $temp1 "$(echo account_name = $(search_list_in "valid_accounts" "$temp1" | choose_one))"
  try_catch "choose any account"
  if_null $(search_in $temp1 "account_name" 3)
  print_key "$(search_in $temp1 "account_name" 3)"
  print_message "Email de la cuenta"
  add_in $temp1 "$(echo account_email = $(search_in $CONFIG_PREF $(search_in $temp1 "account_name" 3) 3))"
  try_catch "get account email"
  if_null $(search_in $temp1 "account_email" 3)
  print_key "$(search_in $temp1 "account_email" 3)"
  print_message "Alcance del cambio"
  add_in $temp1 "$(echo config_scope = $(choose_one "global" "local" "worktree"))"
  try_catch "select any scope"
  if_null $(search_in $temp1 "config_scope" 3)
  print_key "$(search_in $temp1 "config_scope" 3)"
  git_config_account "$(search_in $temp1 "config_global" 3)" "$(search_in $temp1 "account_name" 3)" "$(search_in $temp1 "account_email" 3)"
  try_catch "git config"
else
  print_error "Cambio de cuenta cancelado"
fi
delete_temp
print_key2 "Cuenta cabiada correctamente"
print_finish

#log_debug $(cat $temp2)