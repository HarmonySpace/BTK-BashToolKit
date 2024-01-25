confirm_git
print_montse2 "Selecciona la rama"
add_in $temp1 "$(echo go = $(git branch --list | grep -v "\*" | choose_one))"
if_null $(search_in $temp1 "go" = 2)
print_user "$(search_in $temp1 "go" = 2)"
git switch "$(search_in $temp1 "go" = 2)"
try_catch "change to other branch"
print_montseHappy "Cambio de rama exitosa"
