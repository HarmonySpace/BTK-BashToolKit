#!/bin/bash

# share the dir
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#import libreries
source "$SCRIPT_DIR/../services/import.sh"
## configuration import
source "$SCRIPT_DIR/../config.sh"
try_catch_import $CONFIG_LOADED "Configuration imported"

print_start "git switch"
git_get_branches
log_info "actual branch"
print_message "Tu rama actual ->"
AG_gswi=$(git branch --show-current)
try_catch "take an actual branch"
if_null $AG_gswi
print_key "$AG_gswi"
log_info "$AG_gswi"
log_info "choose an action"
print_message "¿Qué deseas hacer?"
CHOOSE_gswi=$(choose_one cambiar crear eliminar)
try_catch "choose one action"
if_null $CHOOSE_gswi
log_info "option choosed ->> $CHOOSE_gswi"
print_user "$CHOOSE_gswi"
if [[ "$CHOOSE_gswi" = "cambiar" ]]; then
  git_change_branch
elif [[ "$CHOOSE_gswi" = "crear" ]]; then
  git_create_branch
elif [[ "$CHOOSE_gswi" = "eliminar" ]]; then
  git_delete_branch
else
  log_info "invalid option"
  print_error "Opción no valida"
  exit 1
fi
log_info "closing a program"
log_info "finish"
