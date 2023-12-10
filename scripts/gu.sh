#!/bin/bash

# share the dir
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
#import libreries
source "$SCRIPT_DIR/../services/import.sh"
## configuration import
source "$SCRIPT_DIR/../config.sh"
try_catch_import $CONFIG_LOADED "Configuration imported"

# start the script
log_info "clear screan"
clear
try_catch "clear"
log_info "STARTING A PROGRAM"
log_info "starting message"
water
try_catch "print water"
print_custom $CL2 0 none center 0 "1 10" "( ONLY GIT PUSH )"
print_message "Seleccióne los archivos a subir ->"
CHOOSE_gu=$(choose_one "Todos" "Uno")
try_catch "option choose"
log_info "option choosed ->> $CHOOSE_gu"
print_user "$CHOOSE_gu"
if [[ $CHOOSE_gu = "Todos" ]]
then
  log_info "select all files"
  FILE_gu="."
elif [[ $CHOOSE_gu = "Uno" ]]
then
  log_info "browser file"
  FILE_gu="$(file_browser)"
  try_catch "file choose"
  log_info "file choosed ->> $FILE_gu"
  print_message "Archivo seleccionado"
  print_user "$FILE_gu"
else
  log_error "opcioón no valida"
fi
log_info "add files"
git add $FILE_gu
try_catch "adding files"
log_info "creatin a commit"
print_message "Ingressa un commit para el push ->"
COMMIT_gu="$(input_text "Ingresa tu commit acá")"
try_catch "take input"
log_info "input taked $COMMIT_gu"
print_message "Commit obtenido"
print_key "$COMMIT_gu"
git commit -m "$COMMIT_gu"
try_catch "adding commit"
log_info "show credentials"
print_message "$SEC"
print_message "Sus credenciales"
credentials
try_catch "show credentials"
print_message "$SEC"
log_info "upload changes to repository"
spin_time "Upload changes in git" 2
git push
try_catch "make a push"
log_info "successfull"
log_info "closing a program"
print_key "Subida exitosa"
log_info "finish"








