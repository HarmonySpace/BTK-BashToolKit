export a3=$(pwd)
[ -n "$a3" ] &&
	yq -i '.dir = env(a3)' $t1 &&
	gpm -m "Dirección actual" -n &&
	gp -m "$(yq '.dir' $t1)" -b -k &&
	yq '.dir' $t1 | xclip -selection clipboard
