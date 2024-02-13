#!/bin/bash

sf() {
	gum file --file --directory --cursor "$CURSOR" --all --cursor.foreground "$GREEN" --directory.foreground "$BLUE" --file.foreground "$MAGENTA" --selected.foreground "$GEREN" "$1"
}
