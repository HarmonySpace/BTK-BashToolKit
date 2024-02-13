#!/bin/bash

cof() {
	gum confirm --selected.foreground="$BLACK" --prompt.foreground="$WHITE" --unselected.foreground="$WHITE" --affirmative="yes" --negative="no" --default "${1}" && echo "yes" || echo "no"
}
