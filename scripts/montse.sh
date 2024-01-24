#!/bin/bash

# share the dir
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS="$SCRIPT_DIR/../scripts"
## configuration import
source "$SCRIPT_DIR/../config.sh"

init_temp
clear
temp1=$(create_temp)
add_in $temp1 "do = $(get_list_file "$ROUTES" "=" 1 | filter_one "$(print_montse "¿Cómo te ayudo?")" "copiar directorio")"
if_null "$(search_in $temp1 "do" = 2)"
source "$SCRIPTS$(search_in $ROUTES "$(search_in $temp1 "do" = 2)" = 2)"
try_catch "selección de archivo"
delete_temp
print_key "$(print_divider)"

#cat $temp1 | filter_one
#source "$(search_in $temp1 "do" = 2)"
#put_in $temp1 "$(echo option_selected = $(choose_one "   directory" "   github" "   archivos"))"
#if_null "$(search_in $temp1 "option_selected" = 2)"
#if [[ $(search_in $temp1 "option_selected" = 2) =~ "directory" ]]; then
#  source "$SCRIPT_DIR/../scripts/navegation/navegation.sh"
#elif [[ $(search_in $temp1 "option_selected" = 2) =~ "github" ]]; then
#  source "$SCRIPT_DIR/../scripts/gitcli/gitcli.sh"
#elif [[ $(search_in $temp1 "option_selected" = 2) =~ "archivos" ]]; then
#  remove_line_in $temp1 "option_selected"
#  print_message "Opción para \"archivos\""
#  add_in $temp1 "$(echo option_selected = $(choose_one "󰛸  crear atajo de aplicación"))"
#  if_null "$(search_in $temp1 "option_selected" = 2)"
#  print_user "$(search_in $temp1 "option_selected" = 2)"
#  if [[ $(search_in $temp1 "option_selected" = 2) =~ "crear atajo de aplicación" ]]; then
#    temp2=$(create_temp)
#    put_in $temp2 "[Desktop Entry]\nName=empty\nComment=empty\nExec=empty\nIcon=empty\nType=Application\n"
#    print_message "Archivo actual"
#    print_file "$(cat $temp2)"
#    print_message "Nombre del lanzador"
#    add_in $temp1 "$(echo launcher_name = "$(input_text "Ingrese el nombre del lanzador")")"
#    if_null $(search_in $temp1 "launcher_name" = 2)
#    print_user "$(search_in $temp1 "launcher_name" = 2)"
#    print_message "Descripción del lanzador"
#    add_in $temp1 "$(echo launcher_comment = "$(input_text "Ingrese el nombre del lanzador")")"
#    if_null $(search_in $temp1 "launcher_comment" = 2)
#    print_user "$(search_in $temp1 "launcher_comment" = 2)"
#    print_message "Selecciona el lanzador"
#    add_in $temp1 "$(echo launcher_exec = $(file_browser))"
#    if_null $(search_in $temp1 "launcher_exec" = 2)
#    print_user "$(search_in $temp1 "launcher_exec" = 2)"
#    print_message "Selecciona el icono"
#    add_in $temp1 "$(echo launcher_icon = "$(file_browser)")"
#    if_null $(search_in $temp1 "launcher_icon" = 2)
#    print_user "$(search_in $temp1 "launcher_icon" = 2)"
#    replace_in $temp2 $temp2 "Name=empty" "Name=$(search_in $temp1 "launcher_name" = 2)"
#    replace_in $temp2 $temp2 "Comment=empty" "Comment=$(search_in $temp1 "launcher_comment" = 2)"
#    replace_in $temp2 $temp2 "Exec=empty" "Exec=$(search_in $temp1 "launcher_exec" = 2)"
#    replace_in $temp2 $temp2 "Icon=empty" "Icon=$(search_in $temp1 "launcher_icon" = 2)"
#    cp $temp2 "$HOME/.local/share/applications/$(search_in $temp1 "launcher_name" = 2).desktop"
#    print_file "$(cat $temp1)"
#    print_user "$(cat $temp2)"
#  fi
#else
#  print_error "Opción no válida"
#fi
