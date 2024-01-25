print_key "Eliminar una rama"
print_message "Rama a eliminar"
print_warning "¡Rama actual no disponible!"
add_in $temp1 "$(echo to_delete = $(choose_one $(git branch --list | grep -v "\*")))"
if_null $(search_in $temp1 "to_delete" = 2)
print_key "$(search_in $temp1 "to_delete" = 2)"
add_in $temp1 "$(echo confirim_delete = $(confirm_yn "Estas seguro de eliminar"))"
if_null $(search_in $temp1 "confirim_delete" = 2)
if [[ "$(search_in $temp1 "confirim_delete" = 2)" =~ "yes" ]]; then
  git branch -d $(search_in $temp1 "to_delete" = 2)
  try_catch "branch deleted"
else
  print_error "Eliminación cancelada"
fi
