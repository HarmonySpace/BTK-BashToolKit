remove_line_in $temp1 "option_selected"
print_montse2 "¿Qué deseas hacer con \"directory\"?"
add_in $temp1 "$(echo option_selected = $(choose_one "  copiar directorio"))"
if_null "$(search_in $temp1 "option_selected" = 2)"
print_user "$(search_in $temp1 "option_selected" = 2)"
if [[ $(search_in $temp1 "option_selected" = 2) =~ "copiar directorio" ]]; then
  source "$SCRIPT_DIR/../scripts/navegation/copy_dir.sh"
fi
