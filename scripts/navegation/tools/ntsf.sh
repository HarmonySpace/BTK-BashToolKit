export v1="$1"
if [[ ! "$v1" ]]; then
	false
fi
yq '.[env(v1)] = []' $t1 -i
v2="yes"
while [[ "$v2" == "yes" ]]; do
	clear
	gpm -m "Selecciona los archivos a añadir al push" -n
	gp -m "Archivos seleccionados" -u
	gp -m " $(yq '.[env(v1)]' $t1)" -bu
	export v3=$(sf "./")
	if [[ ! "$v3" ]]; then
		break
	fi
	v4="$(yq '.[env(v1)][] | select(contains(env(v3)))' $t1)"
	echo "$v4"
	if [[ ! "$v4" ]]; then
		gp -m "Ruta añadida" -u
		gp -m "$(echo "$v3")" -bu
		yq '.[env(v1)] += env(v3)' $t1 -i
	else
		clear
		gpm -m "Ruta añadida anteriormente" -f
	fi
	v2=$(cof "¿Desea agregar otro archivo?")
done
