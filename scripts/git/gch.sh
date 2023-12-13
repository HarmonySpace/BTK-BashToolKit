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
log_info "STARTING A PROGRAM"
log_info "starting message"
water
try_catch "print a starting message"
print_custom $CL2 0 none center 0 "1 4" "( ONLY GIT CHECKOUT BRANCH )"
log_info "Take an actual branch"
print_message "Tu rama actual ->"
print_key "$(git rev-parse --abbrev-ref HEAD)"
try_catch "take an actual branch"
log_info "check git status"
print_divider
git_status
print_divider
log_info "check a unpushed changes"
git_check_unpushed
print_message "Selecciona la rama a cambiar ->"
CHOOSE_gch=$(choose_one $(git branch --list | grep -v "\*"))
try_catch "take a others branchs"
log_info "option choosed ->> $CHOOSE_gch"
print_message "Cambiando a la rama"
print_user "$CHOOSE_gch"
log_info "Choosing to $CHOOSE_gch branch"
git checkout "$CHOOSE_gch"
try_catch "change to $CHOOSE_gch"
log_info "closing a program"
print_key "Cambio de rama exitosa"
log_info "finish"


