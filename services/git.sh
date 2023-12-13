#!/bin/bash

# git status
function git_status (){
  print_warning "Tu estatus de la rama actual"
  git status
  return 0
}


# git unpushed check
function git_check_unpushed (){
  UNPUSHED_GCH=$(git diff --name-only)
  if [[ -z "$unpushed_files" ]]
  then
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

# export default
export GIT_SERVICES_LOADED=true