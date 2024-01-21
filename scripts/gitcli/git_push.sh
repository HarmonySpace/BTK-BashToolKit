print_montse "Añadir archivos al git push"
put_in $temp1 "$(echo files_to_add = $(choose_one "todos" "uno"))"
if_null $(search_in $temp1 "files_to_add" = 2)
print_montse2 "Archivos a añadir"
print_user_b "$(search_in $temp1 "files_to_add" = 2)"
if [[ $(search_in $temp1 "files_to_add" = 2) =~ "todos" ]]; then
  add_in $temp1 "$(echo files_selected = .)"
  if_null $(search_in $temp1 "files_selected" = 2)
elif [[ $(search_in $temp1 "files_to_add" = 2) =~ "uno" ]]; then
  source "$SCRIPT_DIR/../scripts/navegation/select_files.sh"
fi
spin_command "git add" "$(git add $(search_list_in "files_selected" $temp1 =)) && $(try_catch "git add")"
print_montse "Commit para el push"
add_in $temp1 "$(echo git_commit = $(input_text "Ingresa el commiit acá"))"
if_null $(search_in $temp1 "git_commit" = 2)
print_montseHappy " Commit obtenido"
print_user_b "$(search_in $temp1 "git_commit" = 2)"
spin_command "git commit" "$(git commit -m "$(search_in $temp1 "git_commit" = 2)")"
add_in $temp1 "$(echo actual_account = $(git config --get user.name))"
if_null $(search_in $temp1 "actual_account" = 2)
credentials "$(search_in $temp1 "actual_account" = 2)"
git push
try_catch "git push"
delete_temp
print_montseHappy "Archivos subidos correctamente"
print_key "$SEC3"
