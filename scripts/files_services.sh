#!/bin/bash

function file_search (){
  OP="${1}"
  if [[ $OP = "default" ]]
  then
    gum file --cursor "> " --all --cursor.foreground "$CL1" --directory.foreground "$CL2" --file.foreground "$FR" --selected.foreground "$CL1" "./"
  elif [[ $OP = "custom" ]]
  then
    ALL="${3}"
    if [[ $ALL = "true" ]]
    then
      ALL="--all"
    else
      ALL=""
    fi
    gum file --cursor "${2} " "$ALL" --cursor.foregound "${4}" --directory.foreground "${5}" --file.foreground "${6}" --selected.foreground "${7}" --directory "${8}"
  else
    log_info error "opcion invalida" $SERROR
  fi
}
