#!/bin/bash

#importación de la configuración
source ./config.sh

SEC=$(print_message body "$SEC")

log_sep
log_info info "configuracion importada"
print_message custom $CL1 $CL2 double center 0 "1 10" "GIT TOOL KIT"
log_info info "bienvenida"
MSG=$(print_message key "Git" )
print_message body "Aplicación de consola para el uso cotidiano de $MSG"
log_info info "# interaccion"
print_message body "Interacciones con:"
CHOOSE=$(print_chooseOne default "Ramas")
log_info info "seleccion: $CHOOSE"
print_message key $CHOOSE
MSG=$(print_message key $CHOOSE)
log_info info "## interaccion"
if [[ $CHOOSE = "Ramas" ]]
then
  MSG=$(print_message key "Sección de Ramas")
  print_join $SEC "$MSG" $SEC
  print_message body "Posibles interacciones con $CHOOSE"
  CHOOSE=$(print_chooseOne default "Subir" "Bajar" "Cambiar" "Merge" )
  log_info info "seleccion: $CHOOSE"
  print_message key $CHOOSE
  if [[ $CHOOSE = "Subir" ]]
  then
    log_info info "### interaccion"
    MSG=$(print_message key "Subir cambios a la nube")
    print_join $SEC "$MSG" $SEC
    print_message body "Archivos a subir"
    CHOOSE=$(print_chooseOne default "Todo" "Archivo")
    log_info info "seleccion: $CHOOSE"
    print_message key $CHOOSE
    if [[ $CHOOSE = "Todo" ]]
    then
      log_info info "Añadiendo archivos"
      git add .
      if [[ "$?" = 0 ]]
      then
        log_info info "git add -> successfuly"
      else
        log_info error "git add -> failed"
        log_info error "$?"
        exit 1
      fi
    elif [[ $CHOOSE = "Archivo" ]]
    then
      log_info info "Buscando archivo"
    fi
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
