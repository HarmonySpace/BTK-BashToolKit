#!/bin/bash

fo() {
	gum filter --indicator "$CURSOR" --prompt="$CURSOR_NORMAL" --header "$1" --placeholder "$2" --indicator.foreground "$GREEN" --selected-indicator.foreground "$GREEN" --header.foreground $BLUE --text.foreground $WHITE --cursor-text.foreground $BLUE --match.foreground $GREEN --prompt.foreground $BLUE --limit=1
}
