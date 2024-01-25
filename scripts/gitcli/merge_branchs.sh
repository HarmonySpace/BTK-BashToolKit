confirm_git
print_montse2 "Selecciona la rama main"
print_warning_b "Rama base"
add_in $temp1 "main = $(git branch --list | choose_one)"
if_null $(search_in $temp1 "main" = 2)
print_montse "Selecciona la rama feature"
print_warning_b "Rama de fusión"
add_in $temp1 "feature = $(git branch --list | grep -v "\*" | choose_one)"
if_null $(search_in $temp1 "feature" = 2)
print_montse2 "Cambiando a la rama main"
spin_command "git switch" "$(git switch "$(search_in $temp1 "main" = 2)") && $(try_catch "git switch")"
print_montse "Fusionando las ramas"
spin_command "git merge" "$(git merge "$(search_in $temp1 "feature" = 2)") && $(try_catch "git merge")"
source "$SCRIPTS/../scripts/gitcli/status.sh"
wait_enter
print_montseHappy "Ramas fusionadas correctamente"
