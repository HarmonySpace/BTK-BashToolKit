#/bin/bash

co() {
	gum choose --cursor "$CURSOR" --cursor.foreground $BLUE --item.foreground $WHITE --selected.foreground $GREEN "${@}"
}
