#!/bin/bash

#Print functions in screen

##program functions
function print_message (){
  #color - border-color - border-style - align - margin - padding - message
  gum style --foreground $1 --border-foreground $2 --border $3 --align $4 --margin "$5" --padding "$6" "$7"
}
function print_choose (){
  gum choose --cursor="$1" --cursor.foreground="$2" --item.foreground="$3" --selected.foreground="$4" $5 $6 $7 $8 $9
}
