print_montse "Cuenta configurada"
add_in $temp1 "$(echo actual_account = $(git config --get user.name))"
try_catch "get an actual user"
print_message_b "$(search_in $temp1 "actual_account" = 2)"
add_in $temp1 "$(echo confirm_change = $(confirm_yn '¿Desea cambiar de cuenta?'))"
if_null $(search_in $temp1 "confirm_change" = 2)
if [[ $(search_in $temp1 "confirm_change" = 2) =~ "no" ]]; then
	print_montseSad "Cambio de cuenta cancelado"
	exit 2
fi
add_in $temp1 "$(list_in $temp1 "git_account" $PREF_PATH 4 ' ' accounts)"
if_null $(search_in $temp1 "account" = 2)
remove_element_in $temp1 "$(search_in $temp1 "actual_account" = 2)" "$(search_list_in "accounts" $temp1 =)" "valid_accounts"
if_null $(search_in $temp1 "valid_accounts" = 2)
print_montse "Selecciona una cuenta"
print_warning_b "No se permite cambiar a la misma cuenta"
add_in $temp1 "$(echo go = $(search_list_in "valid_accounts" "$temp1" = | choose_one))"
if_null $(search_in $temp1 "go" = 2)
add_in $temp1 "$(echo account_email = $(search_in $PREF_PATH $(search_in $temp1 "go" = 2) " " 3))"
if_null $(search_in $temp1 "account_email" = 2)
print_montse2 "Alcance de la configuración"
add_in $temp1 "$(echo config_scope = $(choose_one "global" "local" "worktree"))"
if_null $(search_in $temp1 "config_scope" = 2)
git_config_account "$(search_in $temp1 "config_scope" = 2)" "$(search_in $temp1 "go" = 2)" "$(search_in $temp1 "account_email" = 2)"
print_montseHappy "Cambio de cuenta exitosa"

echo hola
