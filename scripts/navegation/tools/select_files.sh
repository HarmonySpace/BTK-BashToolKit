temp_sf=$(create_temp)
try_catch "create a temp file"
add_in $temp1 "$(echo continue = yes)"
while [ "$(search_in $temp1 "continue" = 2)" = "yes" ]; do
  add_in $temp_sf "$(file_browser)"
  print_montseHappy "Archivos seleccionados"
  print_user_b "$(cat $temp_sf)"
  remove_line_in $temp1 "continue"
  add_in $temp1 "$(echo continue = $(confirm_yn "¿Deseas seleccionar otro archivo?"))"
  if_null $(search_in $temp1 "continue" = 2)
  remove_line_in $temp1 "files_selected"
  list_in $temp1 "/" $temp_sf 1 ' ' "files_selected"
  if_null $(search_in $temp1 "files_selected" = 2)
done
