print_montse "Status de la rama actual"
print_warning "Tu estatus de la rama actual"
git status -s
source "$SCRIPTS/../scripts/gitcli/show_branchs.sh"
