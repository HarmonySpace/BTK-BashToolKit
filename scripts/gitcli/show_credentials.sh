print_montse "Selecciona la cuenta"
list_in $temp1 "git_account" $CONFIG_PREF 4 ' ' accounts
if_null "$(search_list_in "accounts" $temp1 =)"
add_in $temp1 "$(echo account_name = $(search_list_in "accounts" $temp1 = | choose_one))"
if_null "$(search_list_in "accounts" $temp1 =)"
print_montseHappy "Tu credenciales $(search_in $temp1 "account_name" = 2)"
credentials "$(search_in $temp1 "account_name" = 2)"
