print_monse "Fusionar 2 ramas"
print_divider
print_warning "Tu estatus de la rama actual"
git status
print_divider
if [[ -z "$unpushed_files" ]]; then
  print_warning "No hay cambios registrados"
  return 0
fi
print_divider
return 0

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
