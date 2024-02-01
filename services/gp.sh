#!/bin/bash

MESSAGE=""
BORDERSOP=""
COLORP="$WHITE"

while getopts 'm:bpfksuweh' OPTION; do
	case "$OPTION" in
	m)
		MESSAGE="$OPTARG"
		;;
	b)
		BORDERSOP="--border $BORDERS --border-foreground $COLORP"
		;;
	p)
		COLORP="$WHITE"
		;;
	f)
		COLORP="$MAGENTA"
		;;
	k)
		COLORP="$BLUE"
		;;
	s)
		COLORP="$CYAN"
		;;
	u)
		COLORP="$GREEN"
		;;
	w)
		COLORP="$YELLOW"
		;;
	e)
		COLORP="$RED"
		;;
	h)
		cat $SERVICES_PATH/man/gp.txt
		;;
	*)
		echo "error: not a valid flag, use -h to help"
		;;
	esac
done

gum style "$MESSAGE" $BORDERSOP --foreground $COLORP --align left --padding "0 1"
