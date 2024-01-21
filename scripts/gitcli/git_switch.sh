print_montse "Tu rama actual"
git_get_branches
put_in $temp1 "$(echo current_branch = $(git branch --show-current))"
if_null $(search_in $temp1 "current_branch" = 2)
print_message_b "$(search_in $temp1 "current_branch" = 2)"
wait_enter
print_montse2 "¿Qué deseas hacer?"
add_in $temp1 "$(echo action_crud = $(choose_one "   switch branch" "   create branch" "󰆴   delete branch"))"
if_null $(search_in $temp1 "action_crud" = 2)
print_user "$(search_in $temp1 "action_crud" = 2)"
if [[ "$(search_in $temp1 "action_crud" = 2)" =~ "switch branch" ]]; then
  source "$SCRIPT_DIR/../scripts/gitcli/switch_branch.sh"
elif [[ "$(search_in $temp1 "action_crud" = 2)" =~ "create branch" ]]; then
  git_create_branch
elif [[ "$(search_in $temp1 "action_crud" = 2)" =~ "delete branch" ]]; then
  git_delete_branch
else
  print_error "Opción no valida"
  exit 1
fi
