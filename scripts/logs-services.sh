#!/bin/bash

#Logs functions

##create a file
function create_log_file (){
  if [ $(ls | grep "$LOG") ]; then
    log_print "The file is correct"
  else
    log_print "ERROR whit the log file"
  fi
}

##write in log file
function log_print (){
  echo "$1" >> $LOG
}
function log_clear (){
  echo "" > $LOG
}
function log_separator(){
  log_print ""
  log_print ""
  log_print ""
  log_print $SEP
}