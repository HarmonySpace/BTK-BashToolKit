temp_sd=$(create_temp)
print_key "Eliminar una rama"
print_message "Rama a eliminar"
print_warning "¡Rama actual no disponible!"
put_in $temp_sd "$(echo to_delete = $(choose_one $(git branch --list | grep -v "\*")))"
if_null $(search_in $temp_sd "to_delete" = 2)
print_key "$(search_in $temp_sd "to_delete" = 2)"
add_in $temp_sd "$(echo confirim_delete = $(confirm_yn "Estas seguro de eliminar"))"
if_null $(search_in $temp_sd "confirim_delete" = 2)
if [[ "$(search_in $temp_sd "confirim_delete" = 2)" =~ "yes" ]]; then
  git branch -d $(search_in $temp_sd "to_delete" = 2)
  try_catch "branch deleted"
else
  print_error "Eliminación cancelada"
fi
