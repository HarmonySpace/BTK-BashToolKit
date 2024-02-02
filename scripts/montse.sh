#!/bin/bash

# share the dir
EXEC_PATH="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
## configuration import
source "$EXEC_PATH/../config.sh"

clear
mTemp
t1=$(cTemp)
a1=$(yq '.routes[].[].[].name' "$CONFIG_PATH/btk.yaml")
echo "$a1"
#gpm -m "HOLA ¿Cómo te puedo ayudar?" -n
#dTemp

#e1="$(echo "hello world")" yq -i '.do = env(e1)' $t1
#yq -i '.Section.key = "value"' $t1

#init_temp
#clear
#temp1=$(create_temp)
#add_in $temp1 "do = $(get_list_file "$ROUTES_PATH" "=" 1 | filter_one "$(print_montse "¿Cómo te ayudo?")" "copiar directorio")"
#if_null "$(search_in $temp1 "do" = 2)"
#source "$SCRIPT_PATH$(search_in $ROUTES_PATH "$(search_in $temp1 "do" = 2)" = 2)"
#try_catch "selección de archivo"
#delete_temp
#print_key "$(print_divider)"

export PATH=$OLD_PATH
