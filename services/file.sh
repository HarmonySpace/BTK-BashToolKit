#!/bin/bash

# print file browser
## file browser
function file_browser (){
  gum file --cursor "> " --all --cursor.foreground "$CL1" --directory.foreground "$CL2" --file.foreground "$FR" --selected.foreground "$CL1" "./"
  return 0
}

## custom file browser
function file_browser_custom (){
  ALL_this="${7}"
  if [[ $ALL_this = "true" ]]; then
    ALL_this="--all"
  else
    ALL_this=""
  fi
  gum file "$ALL_this" --cursor "${1}" --cursor.foregound "${2}" --directory.foreground "${3}" --file.foreground "${4}" --selected.foreground "${5}" --directory "${6}"
  return 0
}

# extract values
## search in file
function search_in (){
  # que - donde - campo
  grep "${1}" "${2}" | cut -d' ' -f${3}
}
## count interactions
function count_that (){
  grep -c "^${1}" "${2}"
}


# temp file
## put in temp.txt
function take_me (){
  touch "${1}" && cat /dev/null > "${1}"
  TAKE=$(grep "${2} =" "${3}" | cut -d' ' -f${4})
  echo $TAKE >> ${1}
}
## drop a line in temp.txt
function drop_me (){
  touch "${1}" && cat /dev/null > "${1}"
  sed "/${2}$/d" "${3}" > "${1}"
}
## put in temp.txt custom
function tk_me (){
  touch "${1}" && cat /dev/null > "${1}"
  TAKE=${2}
  echo $TAKE >> ${1}
}
## add in temp.txt
function add_in (){
  echo ${2} >> ${1}
}
## put in temp.txt
function put_in (){
  echo ${2} > ${1}
}
## get line in temp.txt
function line_in (){
  # salida - arriba abajo - abajo arriba - donde
  head -n ${2} ${4} | tail -n ${3} > ${1}
}
## create a temp list
function take_me_list (){
  touch "${1}" && cat /dev/null > "${1}"
  while read -r line; do
    if [[ "$line" =~ "${2}" ]]; then
      TAKE=$(echo "$line" | cut -d' ' -f${4})
      echo $TAKE >> ${1}
    fi
  done < "${3}"
}
## init temp files
function init_temp (){
  mkdir -p "$TEMP_DIR"
  trap delete_temp EXIT
}
## create temp file
function create_temp (){
  mktemp "$TEMP_DIR/temp_file.XXXXXX"
}
## delete temp file
function delete_temp (){
  rm -rf $CONFIG_PATH/temp
}


# export default
export FILE_SERVICES_LOADED=true
