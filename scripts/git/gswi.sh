#!/bin/bash

# share the dir
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
## configuration import
source "$SCRIPT_DIR/../config.sh"

init_temp
temp1=$(create_temp)
print_start "git switch"
git_get_branches
print_message "Tu rama actual"
put_in $temp1 "$(echo current_branch = $(git branch --show-current))"
if_null $(search_in $temp1 "current_branch" = 2)
print_key "$(search_in $temp1 "current_branch" = 2)"
print_message "¿Qué deseas hacer?"
add_in $temp1 "$(echo action_crud = $(choose_one cambiar crear eliminar))"
if_null $(search_in $temp1 "action_crud" = 2)
print_user "$(search_in $temp1 "action_crud" = 2)"
if [[ "$(search_in $temp1 "action_crud" = 2)" = "cambiar" ]]; then
  git_change_branch
elif [[ "$(search_in $temp1 "action_crud" = 2)" = "crear" ]]; then
  git_create_branch
elif [[ "$(search_in $temp1 "action_crud" = 2)" = "eliminar" ]]; then
  git_delete_branch
else
  print_error "Opción no valida"
  exit 1
fi
delete_temp
