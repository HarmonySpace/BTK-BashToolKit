temp_sb=$(create_temp)
print_montse "Estado de la rama actual"
git_status
remove_line_in $temp1 "continue"
add_in $temp1 "$(echo continue = $(confirm_yn "¿Deseas continuar con el cambio de rama?"))"
if_null $(search_in $temp1 "continue" = 2)
if [[ "$(search_in $temp1 "continue" = 2)" = "no" ]]; then
  print_montseSad "git switch cancelado"
  exit 2
fi
print_montse2 "Selecciona la rama"
put_in $temp_sb "$(echo go = $(git branch --list | grep -v "\*" | choose_one))"
if_null $(search_in $temp_sb "go" = 2)
print_user "$(cat $temp_sb)"
print_user "$(search_in $temp_sb "go" = 2)"
git switch "$(search_in $temp_sb "go" = 2)"
try_catch "change to other branch"
print_montseHappy "Cambio de rama exitosa"
