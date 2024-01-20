remove_line_in $temp1 "option_selected"
print_montse2 "¿Qué deseas hacer con \"github\"?"
add_in $temp1 "$(echo option_selected = $(choose_one "󰛐   show credentials" "  git push"))"
if_null "$(search_in $temp1 "option_selected" = 2)"
if [[ $(search_in $temp1 "option_selected" = 2) =~ "show credentials" ]]; then
  source "$SCRIPT_DIR/../scripts/gitcli/show_credentials.sh"
elif [[ $(search_in $temp1 "option_selected" = 2) =~ "git push" ]]; then
  source "$SCRIPT_DIR/../scripts/git/gu.sh"
fi
