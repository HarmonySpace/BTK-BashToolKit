source "$SCRIPTS/../scripts/gitcli/status.sh"
remove_line_in $temp1 "continue"
add_in $temp1 "$(echo continue = $(confirm_yn "¿Deseas continuar con el cambio de rama?"))"
if_null $(search_in $temp1 "continue" = 2)
if [[ "$(search_in $temp1 "continue" = 2)" = "no" ]]; then
  print_montseSad "git switch cancelado"
  exit 2
fi
print_montse2 "Selecciona la rama"
add_in $temp1 "$(echo go = $(git branch --list | grep -v "\*" | choose_one))"
if_null $(search_in $temp1 "go" = 2)
print_user "$(cat $temp1)"
print_user "$(search_in $temp1 "go" = 2)"
git switch "$(search_in $temp1 "go" = 2)"
try_catch "change to other branch"
print_montseHappy "Cambio de rama exitosa"
