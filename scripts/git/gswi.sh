#!/bin/bash

# share the dir
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
## configuration import
source "$SCRIPT_DIR/../config.sh"

print_start "git switch"
git_get_branches
print_message "Tu rama actual ->"
AG_gswi=$(git branch --show-current)
try_catch "take an actual branch"
if_null $AG_gswi
print_key "$AG_gswi"
print_message "¿Qué deseas hacer?"
CHOOSE_gswi=$(choose_one cambiar crear eliminar)
try_catch "choose one action"
if_null $CHOOSE_gswi
print_user "$CHOOSE_gswi"
if [[ "$CHOOSE_gswi" = "cambiar" ]]; then
  git_change_branch
elif [[ "$CHOOSE_gswi" = "crear" ]]; then
  git_create_branch
elif [[ "$CHOOSE_gswi" = "eliminar" ]]; then
  git_delete_branch
else
  print_error "Opción no valida"
  exit 1
fi
