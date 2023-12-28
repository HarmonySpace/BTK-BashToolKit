#!/bin/bash

# share the dir
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#import libreries
source "$SCRIPT_DIR/../services/import.sh"
## configuration import
source "$SCRIPT_DIR/../config.sh"
try_catch_import $CONFIG_LOADED "Configuration imported"

log_info "clean a screen"
clear
log_info "print a dog ascii"
water_dog
try_catch "print a dog draw"
print_key2 "WOOF WOOF... como te ayudo? ->"
log_info "choose an option"
CHOOSE_dog=$(choose_one "directory" "github")
try_catch "option selected"
log_info "option choosed ->> $CHOOSE_dog"
print_message "Opción seleccionada"
print_user "$CHOOSE_dog"
if [[ "$CHOOSE_dog" = "directory" ]]; then
  log_info "directory actions"
  CHOOSE_dog=$(choose_one "copy dir")
  try_catch "option selected"
  log_info "option choosed ->> $CHOOSE_dog"
  print_message "Opcion seleccionada"
  print_user "$CHOOSE_dog"
  if [[ "$CHOOSE_dog" = "copy dir" ]]; then
    log_info "take actual directory"
    DIR_actual=$(pwd)
    print_message "Direcciòn actual"
    print_key "$DIR_actual"
    log_info "copy actual dir"
    pwd | xclip -selection clipboard
    try_catch "dir copy"
  fi
elif [[ "$CHOOSE_dog" = "github" ]]; then
  log_info "github actions"
  CHOOSE_dog=$(choose_one "Mostrar credenciales")
  try_catch "option selected"
  log_info "option choosed ->> $CHOOSE_dog"
  print_message "Opción seleccionada"
  print_user "$CHOOSE_dog"
  if [[ "$CHOOSE_dog" = "Mostrar credenciales" ]]
  then
    credentials
    try_catch
  fi
fi
log_info "closing a program"
print_key2 "WOOF adios!"
log_info "finish"




