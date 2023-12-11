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
print_custom $CL2 0 none center 0 "1 5" "WOOF WOOF... what do you need?"
log_info "choose an option"
CHOOSE_dog=$(choose_one "github")
try_catch "option selected"
log_info "option choosed ->> $CHOOSE_dog"
print_message "Option selected"
print_user "$CHOOSE_dog"
if [[ "$CHOOSE_dog" = "github" ]]
then
  log_info "choose an $CHOOSE_dog option"
  CHOOSE_dog=$(choose_one "show credentials")
  try_catch "option selected"
  log_info "option choosed ->> $CHOOSE_dog"
  print_message "Option selected"
  print_user "$CHOOSE_dog"
  if [[ "$CHOOSE_dog" = "show credentials" ]]
  then
    print_divider
    credentials
    try_catch
    print_divider
  fi
fi




