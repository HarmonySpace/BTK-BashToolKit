#!/bin/bash

# print file browser
## file browser
function file_browser() {
  gum file --cursor "$CURSOR" --all --cursor.foreground "$CL1" --directory.foreground "$CL2" --file.foreground "$FR" --selected.foreground "$CL1" "./"
  return 0
}

## custom file browser
function file_browser_custom() {
  ALL_this="${7}"
  if [[ $ALL_this = "true" ]]; then
    ALL_this="--all"
  else
    ALL_this=""
  fi
  gum file "$ALL_this" --cursor "${1}" --cursor.foregound "${2}" --directory.foreground "${3}" --file.foreground "${4}" --selected.foreground "${5}" --directory "${6}"
  return 0
}

## add in temp.txt
function add_in() {
  echo -e ${2} >>${1}
}
## put in temp.txt
function put_in() {
  echo -e ${2} >${1}
}
## get line in temp.txt
function line_in() {
  # salida - arriba abajo - abajo arriba - donde
  head -n ${2} ${4} | tail -n ${3} >${1}
}

## remove a line in temp.txt
# donde - que
function remove_line_in() {
  temp_removelinein=$(create_temp)
  grep -v "${2}" "${1}" >"$temp_removelinein"
  mv "$temp_removelinein" "${1}"
}
## get line what I search in temp.txt
function search_in() {
  # donde - que - caracter - campo
  grep "${2}" "${1}" | cut -d"${3}" -f${4} | sed 's/^[[:space:]]*//;s/[[:space:]]*$//'
}
## remplace string in temp file
function replace_in() {
  # donde - salida - que - con
  temp_replacein=$(create_temp)
  sed "s#${3}#${4}#g" "${1}" >"${temp_replacein}"
  mv "${temp_replacein}" "${2}"
  # NOTA: Los # son para evitar problemas con las rutas
}
## get a file list
function get_list_file() {
  #cat "${1}" | cut -d"${2}" -f"${3}" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//'
  cat "${1}" | grep -v "^#" | cut -d"${2}" -f"${3}"
  #cat "${1}" | cut -d"${2}" -f"${3}"
  #cat "${1}" | sed -e 's/^[[:space:]]+|[[:space:]]+$//g' | cut -d"${2}" -f"${3}"
  #cat "${1}" | tr -d '[[:space:]]' | cut -d"${2}" -f"${3}"
}
## create a list in temp.txt
function list_in() {
  # salida - que - donde - campo - caracter - como
  temp_listin=$(create_temp)
  while read -r line; do
    if [[ "$line" =~ "${2}" ]]; then
      add_in $temp_listin "$(echo "$line" | cut -d"${5}" -f${4})"
    fi
  done <"${3}"
  add_in ${1} "$(echo "${6}" = $(cat $temp_listin | tr '\n' ' '))"
}
function add_to_list() {
  # donde - salida - lista - que
  temp_addtolist=$(create_temp)
  sed "/${3}/ s/$/ ${4}/" "${2}" >"${temp_addtolist}"
  mv "${temp_addtolist}" "${1}"
}
## get content what I search in temp.txt
function search_list_in() {
  # que - donde - caracter
  while IFS= read -r line; do
    if [[ "$line" =~ "${1}" ]]; then
      echo "$line" | awk -F"${3}" '{print $2}' | sed 's/^[[:space:]]*//' | tr ' ' '\n'
    fi
  done <"${2}"
}
## remove an element in temp.txt
function remove_element_in() {
  # salida - que - lista - como
  temp_removein=$(create_temp)
  put_in $temp_removein "$(echo "${3}" | sed "s/\b${2}\b//")"
  put_in $temp_removein "$(cat $temp_removein | sed 's/  */ /g')"
  add_in ${1} "$(echo "${4}" = $(cat $temp_removein))"
}

## init temp files
function init_temp() {
  mkdir -p "$TEMP_DIR"
}
## create temp file
function create_temp() {
  mktemp "$TEMP_DIR/temp_file.XXXXXX"
}
## delete temp file
function delete_temp() {
  rm -rf $TEMP_DIR
}

## extract values
### search in file
#function search_in_file (){
#  # que - donde - campo
#  grep "${1}" "${2}" | cut -d' ' -f${3}
#}
### count interactions
#function count_that (){
#  grep -c "^${1}" "${2}"
#}
#
## temp file
### put in temp.txt
#function take_me (){
#  touch "${1}" && cat /dev/null > "${1}"
#  TAKE=$(grep "${2} =" "${3}" | cut -d' ' -f${4})
#  echo $TAKE >> ${1}
#}
### drop a line in temp.txt
#function drop_me (){
#  touch "${1}" && cat /dev/null > "${1}"
#  sed "/${2}$/d" "${3}" > "${1}"
#}
### put in temp.txt custom
#function tk_me (){
#  touch "${1}" && cat /dev/null > "${1}"
#  TAKE=${2}
#  echo $TAKE >> ${1}
#}
### create a temp list
#function take_me_list (){
#  touch "${1}" && cat /dev/null > "${1}"
#  while read -r line; do
#    if [[ "$line" =~ "${2}" ]]; then
#      TAKE=$(echo "$line" | cut -d' ' -f${4})
#      echo $TAKE >> ${1}
#    fi
#  done < "${3}"
#}
## create a list in temp.txt
#function list_in (){
#  #touch "${1}" && cat /dev/null > "${1}"
#  # salida - que - donde - campo
#  while read -r line; do
#    if [[ "$line" =~ "${2}" ]]; then
#      TAKE=$(echo "$line" | cut -d' ' -f${4})
#      echo $TAKE >> ${1}
#    fi
#  done < "${3}"
#}

# export default
export FILE_SERVICES_LOADED=true
