#!/bin/bash

# share the dir
EXEC_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
# configuration import
source "$EXEC_PATH/../config.sh"

clear
# try_catch
{
	mTemp
	t1=$(cTemp)
	if [[ ! "$t1" ]]; then
		false
	fi
	test -f "$t1"
	export am1=$(yq '.routes[].[].[].name' "$CONFIG_PATH/btk.yaml" | fo "$(gpm -m "Hola, ¿Cómo puedo ayudarte?" -n)" "copiar directorio")
	if [[ ! "$am1" ]]; then
		false
	fi
	export am2=$(yq '.routes[].[].[] | select(.name == env(am1)) | .route' "$CONFIG_PATH/btk.yaml")
	if [[ ! "$am2" ]]; then
		false
	fi
	yq '.do = env(am2)' $t1 -i
	source "$SCRIPT_PATH$(yq '.do' $t1)"
} || {
	gpm -m "Fail = $?" -s
	gum log --time ansic --level fatal "$?" --level.foreground $RED
	dTemp
	export PATH=$OLD_PATH
	exit 1
}
read -n 1 -s -r -p "Press any key to continue"
dTemp
export PATH=$OLD_PATH
