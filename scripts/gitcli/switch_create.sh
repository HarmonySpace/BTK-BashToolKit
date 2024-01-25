print_montse "Ingresa un nombre para tu rama"
add_in $temp1 "$(echo branch_name = $(input_text "box"))"
if_null $(search_in $temp1 "branch_name" = 2)
print_montseHappy "Nombre obtenido"
print_user_b "$(search_in $temp1 "branch_name" = 2)"
print_montse "Selecciona una rama de origen"
add_in $temp1 "$(echo origin_branch = $(choose_one $(git branch --list | cut -c3-) "Huérfana"))"
if_null $(search_in $temp1 "origin_branch" = 2)
print_montseHappy "Rama origen"
print_user_b "$(search_in $temp1 "origin_branch" = 2)"
if [[ "$(search_in $temp1 "origin_branch" = 2)" =~ "Huérfana" ]]; then
  print_montse "Creando rama Huérfana"
  PARAM_CR="--orphan"
else
  print_montse "Cambiando a la rama origen"
  PARAM_CR=""
fi
git switch $PARAM_CR "$(search_in $temp1 "origin_branch" = 2)"
try_catch "change to origin"
git switch -c "$(search_in $temp1 "branch_name" = 2)"
try_catch "branch created"
print_montse "¿Desea subir la rama actual?"
add_in $temp1 "$(echo push = $(confirm_yn "¿Subir la rama actual?"))"
if_null $(search_in $temp1 "push" = 2)
if [[ "$(search_in $temp1 "push" = 2)" = "yes" ]]; then
  add_in $temp1 "$(echo actual_account = $(git config --get user.name))"
  if_null $(search_in $temp1 "actual_account" = 2)
  credentials "$(search_in $temp1 "actual_account" = 2)"
  git push --set-upstream origin "$(search_in $temp1 "branch_name" = 2)"
fi
print_montseHappy "Rama creada exitosamente"
