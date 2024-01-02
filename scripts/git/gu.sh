#!/bin/bash

# share the dir
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
## configuration import
source "$SCRIPT_DIR/../config.sh"

# start the script
init_temp
print_start "git push"
print_message "Archivos a subir"
temp1=(create_temp)
try_catch "create a temp file"
put_in $temp1 "$(echo files_to_add = $(choose_one "todos" "uno"))"
if_null $(search_in $temp1 "files_to_add" = 2)
print_key "$(search_in $temp1 "files_to_add" = 2)"
if [[ $(search_in $temp1 "files_to_add" = 2) =~ "todos" ]]; then
  add_in $temp1 "$(echo files_selected = .)"
  if_null $(search_in $temp1 "files_selected" = 2)
elif [[ $(search_in $temp1 "files_to_add" = 2) =~ "uno" ]]; then
  temp_gu=$(create_temp)
  try_catch "create a temp file"
  add_in $temp1 "$(echo continue = yes)"
  while [ "$(search_in $temp1 "continue" = 2)" = "yes" ]; do
    add_in $temp_gu "$(file_browser)"
    print_message "Archivos seleccionados"
    print_key "$(cat $temp_gu)"
    remove_line_in $temp1 "continue"
    add_in $temp1 "$(echo continue = $(confirm_yn "¿Deseas seleccionar otro archivo?"))"
    if_null $(search_in $temp1 "continue" = 2)
    remove_line_in $temp1 "files_selected"
    list_in $temp1 "/BashToolKit" $temp_gu 2 " " "files_selected"
    if_null $(search_in $temp1 "files_selected" = 2)
  done
fi
spin_command "git add" "$(git add $(search_list_in "files_selected" $temp1 =)) && $(try_catch "git add")"
print_message "Commit para el push"
add_in $temp1 "$(echo git_commit = $(input_text "Ingresa el commiit acá"))"
if_null $(search_in $temp1 "git_commit" = 2)
print_key "$(search_in $temp1 "git_commit" = 2)"
spin_command "git commit" "$(git commit -m "$(search_in $temp1 "git_commit" = 2)")"
add_in $temp1 "$(echo actual_account = $(git config --get user.name))"
if_null $(search_in $temp1 "actual_account" = 2)
credentials "$(search_in $temp1 "actual_account" = 2)"
git push
try_catch "git push"
print_file "$(cat $temp1)"
delete_temp
print_finish
# > > >
# git add $FILE_gu
# try_catch "adding files"
# print_message "Ingressa un commit para el push ->"
# COMMIT_gu="$(input_text "Ingresa tu commit acá")"
# try_catch "take input"
# if_null $COMMIT_gu
# print_message "Commit obtenido"
# print_user "$COMMIT_gu"
# git commit -m "$COMMIT_gu"
# try_catch "adding commit"
# credentials
# try_catch "show credentials"
# spin_time "Upload changes in git" 2
# git push
# try_catch "make a push"
# print_key "Subida exitosa"
