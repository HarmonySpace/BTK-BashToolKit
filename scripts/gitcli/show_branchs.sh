print_message_b "$(print_key2 "Ramas registradas")" "$(git branch --list | paste -s -d " ")"
add_in $temp1 "$(echo current_branch = $(git branch --show-current))"
if_null $(search_in $temp1 "current_branch" = 2)
print_message_b "Tu rama actual" "$(print_key "$(search_in $temp1 "current_branch" = 2)")"
