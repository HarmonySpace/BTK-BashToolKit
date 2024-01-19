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
function print_message_b() {
  mwidth=$(( $(tput cols) / 2 )) && mwidth=$(( $mwidth / 2 )) && mwidth=$(( $mwidth * 3 ))
  gum style --foreground $FR --align left --border normal --border-foreground $FR --width $mwidth "${1}"
  echo ""
  return 0
}
## print a body file
function print_file() {
  gum style --foreground $FT --align left "${1}"
  return 0
}
function print_file_b() {
  mwidth=$(( $(tput cols) / 2 )) && mwidth=$(( $mwidth / 2 )) && mwidth=$(( $mwidth * 3 ))
  gum style --foreground $FT --align left --border normal --border-foreground $FT --width $mwidth "${1}"
  echo ""
  return 0
}
## print a key message
function print_key (){
  gum style --foreground $CL1 --align left "${1}"
  return 0
}
function print_key_b (){
  mwidth=$(( $(tput cols) / 2 )) && mwidth=$(( $mwidth / 2 )) && mwidth=$(( $mwidth * 3 ))
  gum style --foreground $CL1 --align left --border normal --border-foreground $CL1 --width $mwidth "${1}"
  echo ""
  return 0
}
## print a key second message
function print_key2 (){
  gum style --foreground $CL2 --align left "${1}"
  return 0
}
function print_key2_b (){
  mwidth=$(( $(tput cols) / 2 )) && mwidth=$(( $mwidth / 2 )) && mwidth=$(( $mwidth * 3 ))
  gum style --foreground $CL2 --align left --border normal --border-foreground $CL2 --width $mwidth "${1}"
  echo ""
  return 0
}
## print a key message
function print_user (){
  gum style --foreground $UFR --align left "${1}"
  return 0
}
function print_user_b (){
  mwidth=$(( $(tput cols) / 2 )) && mwidth=$(( $mwidth / 2 )) && mwidth=$(( $mwidth * 3 ))
  echo $mwidth
  gum style --foreground $UFR --align left --border normal --border-foreground $UFR --width $mwidth "${1}"
  echo ""
  return 0
}
## print a warning message
function print_warning (){
  gum style --foreground $WR --align left "${1}"
  return 0
}
function print_warning_b (){
  mwidth=$(( $(tput cols) / 2 )) && mwidth=$(( $mwidth / 2 )) && mwidth=$(( $mwidth * 3 ))
  gum style --foreground $WR --align left --border normal --border-foreground $WR --width $mwidth "${1}"
  echo ""
  return 0
}
## print a error message
function print_error (){
  gum style --foreground $ERR --align left "${1}"
  return 0
}
function print_error_b (){
  mwidth=$(( $(tput cols) / 2 )) && mwidth=$(( $mwidth / 2 )) && mwidth=$(( $mwidth * 3 ))
  mwidth=$(( $(tput cols) / 2 ))
  gum style --foreground $ERR --align left --border normal --border-foreground $ERR --width $mwidth "${1}"
  echo ""
  return 0
}
## print a custom message
function print_custom (){
  cwidth=$(( ${9} ))
  gum style --foreground "${1}" --border-foreground "${2}" --border "${3}" --align "${4}" --margin "${5}" --padding "${6}" --background "${8}" --width $cwidth "${7}"
  return 0
}
function print_montse (){
  clear
  mwidth=$(( $(tput cols) / 2 ))
  gum join "$(print_custom $CL2 $CL2 normal center 0 "0 1" "=＾● ⋏ ●＾=")" "$(print_custom $CL2 $CL2 normal left "0 3" "0 1" "${1}" 0 "$mwidth")"
  echo ""
}
function print_montse2 (){
  clear
  mwidth=$(( $(tput cols) / 2 ))
  gum join "$(print_custom $CL2 $CL2 normal center 0 "0 1" "= ^・ ⋏ ・^ =")" "$(print_custom $CL2 $CL2 normal left "0 3" "0 1" "${1}" 0 "$mwidth")"
  echo ""
}
function print_montseHappy (){
  clear
  mwidth=$(( $(tput cols) / 2 ))
  gum join "$(print_custom $CL2 $CL2 normal center 0 "0 1" "= ^- ⋏ -^ =")" "$(print_custom $CL2 $CL2 normal left "0 3" "0 1" "${1}" 0 "$mwidth")"
  echo ""
}
function print_montseSad (){
  clear
  mwidth=$(( $(tput cols) / 2 ))
  gum join "$(print_custom $ERR $ERR normal center 0 "0 1" "= ^T ⋏ T^ =")" "$(print_custom $ERR $ERR normal left "0 3" "0 1" "${1}" 0 "$mwidth")"
  echo ""
  echo ""
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
  print_montseHappy "¡ ADIÓS !"
}

# export default
export PRINTS_SERVICES_LOADED=true
