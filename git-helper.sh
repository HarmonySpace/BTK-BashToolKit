#!/bin/bash

#importación de la configuración
source ./config.sh

SEC=$(print_message body "$SEC")
SEC2=$(print_message body "$SEC2")

log_sep
log_info info "configuracion importada"
log_info info "mensaje de bienvenida"
print_message custom $CL1 $CL2 double center 0 "1 10" "GIT TOOL KIT"
MSG=$(print_message key "Git" )
print_message body "Aplicación de consola para el uso cotidiano de $MSG"
log_info info "seleccionado interaccion"
print_message body "Interacciones con:"
CHOOSE=$(print_chooseOne default "Git" "Ramas")
log_info info "seleccion: $CHOOSE"
print_message key $CHOOSE
MSG=$(print_message key $CHOOSE)
if [[ $CHOOSE = "Git" ]]
then
  MSG=$(print_message key "Configuración de GitToolKit")
  print_join $SEC "$MSG" $SEC
  log_info info "seleccionado configuraccion"
  print_message body "Posibles configuraciónes"
  CHOOSE=$(print_chooseOne default "Credenciales" "Logs")
  log_info info "seleccion: $CHOOSE"
  print_message key $CHOOSE
elif [[ $CHOOSE = "Ramas" ]]
then
  MSG=$(print_message key "Gestión de Ramas")
  print_join $SEC "$MSG" $SEC
  log_info info "seleccionando interaccion con ramas"
  print_message body "Posibles interacciones con las Ramas"
  CHOOSE=$(print_chooseOne default "Subir" "Bajar" "Cambiar" "Merge" )
  log_info info "seleccion: $CHOOSE"
  print_message key $CHOOSE
  if [[ $CHOOSE = "Subir" ]]
  then
    log_info info "### interaccion"
    MSG=$(print_message key "Subir cambios a la nube")
    print_join $SEC2 "$MSG" $SEC2
    print_message body "Archivos a subir"
    CHOOSE=$(print_chooseOne default "Todo" "Archivo")
    log_info info "seleccion: $CHOOSE"
    print_message key $CHOOSE
    if [[ $CHOOSE = "Todo" ]]
    then
      log_info info "Todos seleccionados"
      FILE="."
    elif [[ $CHOOSE = "Archivo" ]]
    then
      log_info info "buscando archivo"
      print_message body "Seleccione el archivo a subir"
      FILE=$(file_search default)
      log_info info "Archivo seleccionado: $FILE"
      print_message body "Archivo seleccionado:"
      MSG=$(print_message key "$FILE")
      print_message key "$MSG"
    fi
    log_info info "Añadiendo archivos"
    git add "$FILE"
    try_catch "git add"
    log_info info "Captando el commit del usuario"
    MSG=$(print_message key "Añadir un nombre al commit:")
    print_join $SEC2 "$MSG" $SEC2
    COMMIT=$(print_input default "Insertar el commit acá")
    git commit -m "$COMMIT"
    try_catch "git commit"
    log_info info "Subiendo cambios"
    git push
    try_catch
  fi
fi















##way to do
##"ramas" selection
#if [[ $CHOOSE1 = "Ramas" ]]
#then
#  log_print "### BRANCH ACTIONS"
#  print_message $FR 0 none left 0 "1 2" "Acciones disponibles con las ramas:"
#   #readarray -t GIT_BRANCHS < <(git for-each-ref --format='%(refname:short)' 'refs/heads/')
#   #GIT_CHOOSE1=$(print_choose "> " $CL1 $FR $CL1 "${GIT_BRANCHS[@]}")
#   #print_message $UFR 0 none left 0 "0 5" $GIT_CHOOSE1
#   #git checkout $GIT_CHOOSE1
##"repositorio" selection
#elif [[ $CHOOSE1 = "Repositorio" ]]
#then
#  log_print "### REPOSITORY ACTIONS"
##"logs" señection
#elif [[ $CHOOSE1 = "Logs" ]]
#then
#  log_print "### LOGS ACTIONS"
#  print_message $FR 0 none left 0 "1 2" "¿Qué deseas hacer con los Logs?"
#  LOG_CHOOSE1=$(print_choose "> " $CL1 $FR $CL1 show clear)
#  log_print "true"
#  log_print "Selection: $LOG_CHOOSE1" 
#  print_message $UFR 0 none left 0 "0 5" $LOG_CHOOSE1
#  if [[ $LOG_CHOOSE1 = "show" ]]
#  then
#    log_print "#### Showing logs"
#    cat ./$LOG
#  elif [[ $LOG_CHOOSE1 = "clear" ]]
#  then
#    log_print "#### Cleaning logs"
#    log_clear
#  fi
#else
#  log_print "ERROR in <Element> selection"
#fi
##closing a program
#print_message $CL2 0 none center 0 "1 1" "Closing the script ..."
#log_print "Closing GTK ..."
