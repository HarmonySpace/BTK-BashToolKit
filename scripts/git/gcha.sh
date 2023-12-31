#!/bin/bash

# share the dir
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
## configuration import
source "$SCRIPT_DIR/../config.sh"

init_temp
print_start "git change account"
temp1=$(create_temp)
try_catch "create one temp"
put_in $temp1 $(git config --get user.name)
try_catch "get an actual user"
print_message "Cuenta configurada"
print_key "$(cat $temp1)"
temp2=$(create_temp)
try_catch "create one temp"
put_in $temp2 $(confirm_yn '¿Desea cambiar de cuenta?')
try_catch "confirm change account"
print_message "¿Desea cambiar de cuenta?"
print_user "$(cat $temp2)"
if [[ $(cat $temp2) =~ "yes" ]]; then
  take_me_list $temp2 "git_account" "$CONFIG_PREF" 4
  try_catch "account search"
  print_message "Cuentas encontradas"
  print_user "$(cat $temp2)"
  drop_me "$temp1" "$(cat $temp1)" "$temp2"
  try_catch "remove actual account"
  print_message "Cuenta a cambiar"
  print_warning "No se permite cambiar a la misma cuenta"
  put_in $temp1 $(cat "$temp1" | choose_one)
  try_catch "choose any account"
  print_user $(cat $temp1)
  print_message "Alcance del cambio"
  put_in $temp1 $(search_in $(cat $temp1) $CONFIG_PREF 3)
  try_catch "extract email"
  add_in $temp1 $(search_in $(cat $temp1) $CONFIG_PREF 4)
  try_catch "extract user"
  put_in $temp2 $(choose_one "global" "local" "worktree")
  try_catch "select any scope"
  temp3=$(create_temp)
  try_catch "create one temp"
  git_config_account "$(cat $temp2)" "$(line_in $temp3 2 1 $temp1 && cat $temp3)" "$(line_in $temp3 1 1 $temp1 && cat $temp3)"
  try_catch "git config"
fi

#log_debug $(cat $temp2)