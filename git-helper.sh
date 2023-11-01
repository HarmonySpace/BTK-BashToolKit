#!/bin/bash

#import configuration
source ./config.sh

#init program
log_separator
log_print "# INIT GIT-TOOL-KIT"
##clear a terminal
clear
##create file
log_print "## LOG FILE"
create_log_file

#print a welcome mesage
print_message $CL1 $CL2 double center 0 "1 10" "Git Tool Kit"
print_message $FR 0 none left 0 0 "Bienvenido a Git Tool Kit, comenzemos a usar $(print_message $CL1 0 none left 0 0 '<git>')"
print_message $FR 0 none left "1 2" 0 "¿Qué deseas hacer?"
log_print "## ELEMENT"
#select the first option
CHOOSE1=$(print_choose "> " $CL1 $FR $CL1 Ramas Repositorio Logs)
log_print "true"
log_print "Selection: $CHOOSE1"
print_message $UFR 0 none left 0 "0 5" $CHOOSE1
#way to do
#"ramas" selection
if [[ $CHOOSE1 = "Ramas" ]]
then
  log_print "### BRANCH ACTIONS"
#"repositorio" selection
elif [[ $CHOOSE1 = "Repositorio" ]]
then
  log_print "### REPOSITORY ACTIONS"
#"logs" señection
elif [[ $CHOOSE1 = "Logs" ]]
then
  log_print "### LOGS ACTIONS"
  print_message $FR 0 none left 0 "1 2" "¿Qué deseas hacer con los Logs?"
  CHOOSE2=$(print_choose "> " $CL1 $FR $CL1 show clear)
  log_print "true"
  log_print "Selection: $CHOOSE2" 
  print_message $UFR 0 none left 0 "0 5" $CHOOSE2
  if [[ $CHOOSE2 = "show" ]]
  then
    log_print "#### Showing logs"
    cat ./$LOG
  elif [[ $CHOOSE2 = "clear" ]]
  then
    log_print "#### Cleaning logs"
    log_clear
  fi
else
  log_print "ERROR in <Element> selection"
fi
#closing a program
print_message $CL2 0 none center 0 "1 1" "Closing the script ..."
log_print "Closing GTK ..."
