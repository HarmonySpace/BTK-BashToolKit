#!/bin/bash

gi() {
	gum input --prompt $CURSOR --char-limit $1 --prompt.foreground $BLUE --cursor.foreground $BLUE --header.foreground $WHITE --width $WSD2 --header "$2" --placeholder "$3"
}

giw() {
	gum write --width $WSD2 --height=$HSD4 --header "$2" --placeholder "$3"--char-limit $1 --base.foreground $WHITE --cursor.foreground $GREEN --line-number.foreground $BLUE --header.foreground $WHITE --prompt.foreground $BLUE
}
