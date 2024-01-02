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
print_key "$(search_in $temp1 "actual_account" = 2)"
add_in $temp1 "$(echo confirm_change = $(confirm_yn '¿Desea cambiar de cuenta?'))"
if_null $(search_in $temp1 "confirm_change" = 2)
print_message "¿Desea cambiar de cuenta?"
print_key "$(search_in $temp1 "confirm_change" = 2)"
if [[ $(search_in $temp1 "confirm_change" = 2) =~ "yes" ]]; then
  add_in $temp1 "$(list_in $temp1 "git_account" $CONFIG_PREF 4 ' ' accounts)"
  if_null $(search_in $temp1 "account" = 2)
  print_message "Cuentas encontradas"
  print_key "$(search_list_in "accounts" $temp1 =)"
  remove_element_in $temp1 "$(search_in $temp1 "actual_account" = 2)" "$(search_list_in "accounts" $temp1 =)" "valid_accounts"
  if_null $(search_in $temp1 "valid_accounts" = 2)
  print_message "Cuenta a cambiar"
  print_warning "No se permite cambiar a la misma cuenta"
  add_in $temp1 "$(echo account_name = $(search_list_in "valid_accounts" "$temp1" = | choose_one))"
  if_null $(search_in $temp1 "account_name" = 2)
  print_key "$(search_in $temp1 "account_name" = 2)"
  print_message "Email de la cuenta"
  add_in $temp1 "$(echo account_email = $(search_in $CONFIG_PREF $(search_in $temp1 "account_name" = 2) " " 3))"
  if_null $(search_in $temp1 "account_email" = 2)
  print_key "$(search_in $temp1 "account_email" = 2)"
  print_message "Alcance del cambio"
  add_in $temp1 "$(echo config_scope = $(choose_one "global" "local" "worktree"))"
  if_null $(search_in $temp1 "config_scope" = 2)
  print_key "$(search_in $temp1 "config_scope" = 2)"
  git_config_account "$(search_in $temp1 "config_global" = 2)" "$(search_in $temp1 "account_name" = 2)" "$(search_in $temp1 "account_email" = 2)"
else
  print_error "Cambio de cuenta cancelado"
fi
delete_temp
print_key2 "Cuenta cabiada correctamente"
print_finish

#log_debug $(cat $temp2)