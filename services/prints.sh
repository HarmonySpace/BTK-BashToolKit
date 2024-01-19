#!/bin/bash

# print messages
## join prints
function print_join() {
  echo "${1}" "${2}" "${3}"
  return 0
}
## print a body message
function print_message() {
  gum style --foreground $FR --align left "${1}"
  return 0
}
## print a body file
function print_file() {
  gum style --foreground $FT --align left "${1}"
  return 0
}
## print a key message
function print_key (){
  gum style --foreground $CL1 --align left "${1}"
  return 0
}
## print a key second message
function print_key2 (){
  gum style --foreground $CL2 --align left "${1}"
  return 0
}
## print a key message
function print_user (){
  gum style --foreground $UFR --align left "${1}"
  return 0
}
## print a warning message
function print_warning (){
  gum style --foreground $WR --align left "${1}"
  return 0
}
## print a error message
function print_error (){
  gum style --foreground $ERR --align left "${1}"
  return 0
}
## print a custom message
function print_custom (){
  gum style --foreground "${1}" --border-foreground "${2}" --border "${3}" --align "${4}" --margin "${5}" --padding "${6}" "${7}" --background "${8}"
  return 0
}
function print_montse (){
  gum join "$(print_custom $CL2 $CL2 normal center 0 "0 1" "=＾● ⋏ ●＾=")" "$(print_custom $CL2 $CL2 normal left "0 3" "0 1" "${1}" $BG)"
}
function print_montseHappy (){
  gum join "$(print_custom $CL2 $CL2 normal center 0 "0 1" "= ^・ ⋏ ・^ =")" "$(print_custom $CL2 $CL2 normal left "0 3" "0 1" "${1}" $BG)"
}
function print_montseHappy (){
  gum join "$(print_custom $CL2 $CL2 normal center 0 "0 1" "= ^- ⋏ -^ =")" "$(print_custom $CL2 $CL2 normal left "0 3" "0 1" "${1}" $BG)"
}
function print_montseSad (){
  gum join "$(print_custom $CL2 $CL2 normal center 0 "0 1" "= ^T ⋏ T^ =")" "$(print_custom $CL2 $CL2 normal left "0 3" "0 1" "${1}" $BG)"
}


## print a separate screen message
function print_divider (){
  print_message " "
  print_message "$SEC2"
  print_message " "
}
# print start message
function print_start (){
  clear
  water
  try_catch "print water" $?
  print_custom $CL2 0 none center 0 "1 10" ">> ${1} <<"
}
function print_finish (){
  print_key ">>> FINALIZADO"
}

# export default
export PRINTS_SERVICES_LOADED=true
