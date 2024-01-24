#!/bin/bash

# git status
function git_status() {
  print_divider
  print_warning "Tu estatus de la rama actual"
  git status
  print_divider
  git_check_unpushed
  print_divider
  return 0
}

# git unpushed check
function git_check_unpushed() {
  UNPUSHED_GCH=$(git diff --name-only)
  if [[ -z "$unpushed_files" ]]; then
    # No unpushed changes found.
    print_warning "No hay cambios registrados"
    return 0
  else
    # Unpushed changes found. Capture the list for user message.
    print_error"Tiene cambios por subir"
    print_message "$unpushed_files"
    print_error "Por favor, sube estos cambios antes de cambiar de rama"
    exit 1
  fi
}

# git branchs
## git check all branch
function git_get_branchs() {
  print_divider
  print_key "Ramas registradas"
  git branch --list | paste -s -d " "
  print_divider
}
## git change branchs
function git_change_branch() {
  temp_gitchangebranch=$(create_temp)
  git_status
  print_message "Cambiar a la rama"
  #put_in $temp_gitchangebranch "$(echo go = $(choose_one $(git branch --list | grep -v "\*")))"
  put_in $temp_gitchangebranch "$(echo go = $(git branch --list | grep -v "\*" | choose_one))"
  if_null $(search_in $temp_gitchangebranch "go" = 2)
  print_user "$(cat $temp_gitchangebranch)"
  print_user "$(search_in $temp_gitchangebranch "go" = 2)"
  git switch "$(search_in $temp_gitchangebranch "go" = 2)"
  try_catch "change to other branch"
  print_key "Cambio de rama exitosa"
}
## git create a branch
function git_create_branch() {
  temp_gitcreatebranck=$(create_temp)
  print_key "Crear nueva Rama"
  print_message "Nombre de la nueva rama"
  put_in $temp_gitcreatebranck "$(echo branch_name = $(input_text "box"))"
  if_null $(search_in $temp_gitcreatebranck "branch_name" = 2)
  print_user "$(search_in $temp_gitcreatebranck "branch_name" = 2)"
  print_message "Rama de origen"
  add_in $temp_gitcreatebranck "$(echo origin_branch = $(choose_one $(git branch --list | cut -c3-) "Huérfana"))"
  if_null $(search_in $temp_gitcreatebranck "origin_branch" = 2)
  print_user "$(search_in $temp_gitcreatebranck "origin_branch" = 2)"
  if [[ "$(search_in $temp_gitcreatebranck "origin_branch" = 2)" =~ "Huérfana" ]]; then
    print_key "Creando rama Huérfana"
    PARAM_CR="--orphan"
  else
    print_key "Cambiando a la rama origen"
    PARAM_CR=""
  fi
  git switch $PARAM_CR "$(search_in $temp_gitcreatebranck "origin_branch" = 2)"
  try_catch "change to origin"
  git switch -c "$(search_in $temp_gitcreatebranck "branch_name" = 2)"
  try_catch "branch created"
}
## git delete a branch
function git_delete_branch() {
  temp_gitdeletebranch=$(create_temp)
  print_key "Eliminar una rama"
  print_message "Rama a eliminar"
  print_warning "¡Rama actual no disponible!"
  put_in $temp_gitdeletebranch "$(echo to_delete = $(choose_one $(git branch --list | grep -v "\*")))"
  if_null $(search_in $temp_gitdeletebranch "to_delete" = 2)
  print_key "$(search_in $temp_gitdeletebranch "to_delete" = 2)"
  add_in $temp_gitdeletebranch "$(echo confirim_delete = $(confirm_yn "Estas seguro de eliminar"))"
  if_null $(search_in $temp_gitdeletebranch "confirim_delete" = 2)
  if [[ "$(search_in $temp_gitdeletebranch "confirim_delete" = 2)" =~ "yes" ]]; then
    git branch -d $(search_in $temp_gitdeletebranch "to_delete" = 2)
    try_catch "branch deleted"
  else
    print_error "Eliminación cancelada"
  fi
}

# git config
## git config account
function git_config_account() {
  git config "--${1}" user.name "${2}"
  try_catch "git user config"
  git config "--${1}" user.email "${3}"
  try_catch "git email config"
}

# export default
export GIT_SERVICES_LOADED=true
