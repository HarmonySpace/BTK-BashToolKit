#!/bin/bash

# share the dir
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
## configuration import
source "$SCRIPT_DIR/../config.sh"

# start the script
print_start "git push"
print_message "Seleccióne los archivos a subir ->"
CHOOSE_gu=$(choose_one "Todos" "Uno")
try_catch "option choose"
if_null $CHOOSE_gu
print_user "$CHOOSE_gu"
if [[ $CHOOSE_gu = "Todos" ]]; then
  FILE_gu="."
elif [[ $CHOOSE_gu = "Uno" ]]; then
  CONTINUE_gu="yes"
  while [ "$CONTINUE_gu" = yes ]
  do
    FILE_gu="$(file_browser)"
    try_catch "file choose"
    if_null $FILE_gu
    print_message "Archivo seleccionado"
    print_user "$FILE_gu"
    CONTINUE_gu=$(confirm_yn "¿Seleccionar otro archivo?")
    try_catch "take a confirmation"
    if_null $CONTINUE_gu
  done
else
  print_error "opcioón no valida"
fi
git add $FILE_gu
try_catch "adding files"
print_message "Ingressa un commit para el push ->"
COMMIT_gu="$(input_text "Ingresa tu commit acá")"
try_catch "take input"
if_null $COMMIT_gu
print_message "Commit obtenido"
print_user "$COMMIT_gu"
git commit -m "$COMMIT_gu"
try_catch "adding commit"
credentials
try_catch "show credentials"
spin_time "Upload changes in git" 2
git push
try_catch "make a push"
print_key "Subida exitosa"
