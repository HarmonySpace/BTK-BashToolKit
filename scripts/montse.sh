#!/bin/bash

# share the dir
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SCRIPTS="$SCRIPT_DIR/../scripts"
## configuration import
source "$SCRIPT_DIR/../config.sh"

init_temp
clear
temp1=$(create_temp)
add_in $temp1 "do = $(get_list_file "$ROUTES" "=" 1 | filter_one "$(print_montse "¿Cómo te ayudo?")" "copiar directorio")"
if_null "$(search_in $temp1 "do" = 2)"
source "$SCRIPTS$(search_in $ROUTES "$(search_in $temp1 "do" = 2)" = 2)"
try_catch "selección de archivo"
delete_temp
print_key "$(print_divider)"

