#!/bin/bash

#importación de la configuración
source ./config.sh

#variables locales
SEC=$(print_message body "$SEC")
SEC2=$(print_message body "$SEC2")

log_sep
log_info info "configuracion importada" $SLOGS
log_info info "mensaje de bienvenida" $SLOGS
print_message custom $CL1 $FR double center 0 "1 10" "GIT TOOL KIT"
print_message custom $CL1 0 none center 0 "1 10" "( ONLY GIT PUSH )"
MSG=$(print_message key "Github" )
print_message body "Aplicación para subir cambios de $MSG"
log_info info "seleccionando cambios" $SLOGS
print_message body "Seleccione los archivos a subir"
CHOOSE=$(print_chooseOne default "Todos" "Uno")
log_info info "se selecciono la opcion $CHOOSE" $SLOGS
print_message key "$CHOOSE"
if [[ $CHOOSE = "Todos" ]]
then
  log_info info "se seleccionaron todos los archivos" $SLOGS
  FILE="."
elif [[ $CHOOSE = "Uno" ]]
then
  log_info info "buscando archivo" $SLOGS
  print_message body "Seleccione el archivo a subir:"
  FILE=$(file_search default)
  try_catch "seleccion de archivos"
  log_info info "archivo seleccionado: $FILE" $SLOGS
  print_message body "Archivo seleccionado:"
  MSG=$(print_message key "$FILE")
  print_message key "$MSG"
  log_info info "se selecciono el archivo" $SLOGS
else
  log_info error "opcioón no valida" $SERROR
fi
log_info info "añadiendo los archivos" $SLOGS
git add "$FILE"
try_catch "subida de archivos : git add"
log_info info "preparando el commit" $SLOGS
print_message body "Añadir mensaje de commit"
COMMIT=$(print_input default "Inserta tu commit acá ...")
print_message key "$COMMIT"
git commit -m "$COMMIT"
try_catch "añadiendo commit : git commit -m"
log_info info "subiendo los cambios de la rama" $SLOGS
git push
try_catch 
log_info info "Cerrando GIT-UP bash" $SLOGS

