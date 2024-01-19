remove_line_in $temp1 "option_selected"
print_montse2 "¿Qué deseas hacer con \"github\"?"
add_in $temp1 "$(echo option_selected = $(choose_one "󰛐   mostrar credenciales"))"
if_null "$(search_in $temp1 "option_selected" = 2)"
if [[ $(search_in $temp1 "option_selected" = 2) =~ "mostrar credenciales" ]]; then

  source "$SCRIPT_DIR/../scripts/gitcli/show_credentials.sh"
fi
