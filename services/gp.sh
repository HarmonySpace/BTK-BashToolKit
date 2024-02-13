#!/bin/bash

MESSAGE=""
BORDERSOP=""
COLORP="$WHITE"
DIMENTIONS="$WSD2"
ALIGNT="left"

while getopts 'm:d:cbpfksuweh' OPTION; do
	case "$OPTION" in
	m)
		MESSAGE="$OPTARG"
		;;
	d)
		DIMENTIONS="$OPTARG"
		;;
	c)
		ALIGNT="center"
		;;
	b)
		BORDERSOP="--border $BORDERS"
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

gum style "$MESSAGE" --foreground $COLORP $BORDERSOP --border-foreground $COLORP --align $ALIGNT --padding "0 0" --width $DIMENTIONS
