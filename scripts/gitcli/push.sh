#/bin/bash

gpm -m "Añadir archivos al git push" -t
export ap1=$(co "Todos" "Seleccionar")
if [[ ! "$ap1" ]]; then
	false
fi
yq -i '.number = env(ap1)' $t1
if [[ $(yq '.number' $t1) == "Seleccionar" ]]; then
	export ap2="files"
	if [[ ! "$ap2" ]]; then
		false
	fi
	source "$SCRIPT_PATH/navegation/tools/ntsf.sh" "$ap2"
fi
clear
gpm -m "Ingrese un commit para el psuh" -n
export ap1=$(gi 50 "Título del commit" "title...")
if [[ ! "$ap1" ]]; then
	false
fi
yq '.commit.title = env(ap1)' $t1 -i
echo ""
ap1=$(giw "" "Descripción del commit      (Esc to exit)" "description...")
if [[ ! "$ap1" ]]; then
	false
fi
yq '.commit.description = env(ap1)' $t1 -i
echo "$ap1"
clear
gpm -m "Datos del commit" -s
gp -m "Título" -p
gp -m "$(yq '.commit.title' $t1)" -bu
gp -m "Descripcion" -p
gp -m "$(yq '.commit.description' $t1)" -bu
read -n 1 -s -r -p "Press any key to continue"
clear
gpm -m "Subiendo cambios" -t
{
	if [[ $(yq '.number' $t1) == "Todos" ]]; then
		git add .
	else
		git add $(yq '.[env(ap2)][]' $t1)
	fi
	git commit -m "$(yq '.commit.title' $t1)" -m "$(yq '.commit.description' $t1)"
	clear
	gpm -m "Git push" -n
	gp -m "Nombre de la cuenta" -p
	gp -m "$(skate get gitName@git-btk)" -u -d 0
	echo ""
	gp -m "Git key" -p
	gp -m "$(skate get gitKey@git-btk)" -u -d 0
	echo ""
	gp -m "Coloca tus credenciales"
  git push
} || {
	git reset --soft HEAD~1
}

#git add $(yq '.[env(ap2)][]' $t1)

# gpm -m "¿Deseas eliminar el seguimiento?" -n
# if [[ $(cof "Eliminar") == "yes" ]]; then
# 	git reset --soft HEAD~1
# fi

# if [[ $(yq '.number' $t1) == "Todos" ]]; then
# 	sp "git add" 'git add .'
# elif [[ $(yq '.number' $t1) == "Seleccionar" ]]; then
# 	export ap2="files"
# 	if [[ ! "$ap2" ]]; then
# 		false
# 	fi
# 	source "$SCRIPT_PATH/navegation/tools/ntsf.sh" "$ap2"
# 	#gum spin sleep 1
# 	#sp "git add" "git add $(yq '.[env(ap2)][]' $t1)"
# 	sp "git add" "sleep 1"
# else
# 	gp -m "Orden No válida"
# 	false
# fi

# print_montse "Añadir archivos al git push"
# put_in $temp1 "$(echo files_to_add = $(choose_one "todos" "uno"))"
# if_null $(search_in $temp1 "files_to_add" = 2)
# print_montse2 "Archivos a añadir"
# print_user_b "$(search_in $temp1 "files_to_add" = 2)"
# if [[ $(search_in $temp1 "files_to_add" = 2) =~ "todos" ]]; then
#   add_in $temp1 "$(echo files_selected = .)"
#   if_null $(search_in $temp1 "files_selected" = 2)
# elif [[ $(search_in $temp1 "files_to_add" = 2) =~ "uno" ]]; then
#   source "$SCRIPT_PATH/navegation/tools/select_files.sh"
# fi
# spin_command "git add" "$(git add $(search_list_in "files_selected" $temp1 =)) && $(try_catch "git add")"
# print_montse "Commit para el push"
# add_in $temp1 "$(echo git_commit = $(input_text "Ingresa el commiit acá"))"
# if_null $(search_in $temp1 "git_commit" = 2)
# print_montseHappy "Commit obtenido"
# print_user_b "$(search_in $temp1 "git_commit" = 2)"
# spin_command "git commit" "$(git commit -m "$(search_in $temp1 "git_commit" = 2)")"
# add_in $temp1 "$(echo actual_account = $(git config --get user.name))"
# if_null $(search_in $temp1 "actual_account" = 2)
# credentials "$(search_in $temp1 "actual_account" = 2)"
# git push
# try_catch "git push"
# print_montseHappy "Archivos subidos correctamente"
