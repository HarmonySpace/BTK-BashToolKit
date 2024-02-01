#!/bin/bash

MESSAGE=""
COLORP=""
THIS_PETH=""

while getopts 'm:ntfs' OPTION; do
	case "$OPTION" in
	m)
		MESSAGE="$OPTARG"
		;;
	n)
		COLORP="-p"
		THIS_PETH="$PET"
		;;
	t)
		COLORP="-p"
		THIS_PETH="$PET_NORMAL"
		;;
	f)
		COLORP="-e"
		THIS_PETH="$PET_SAD"
		;;
	s)
		COLORP="-k"
		THIS_PETH="$PET_HAPPY"
		;;
	h)
		cat $SERVICES_PATH/man/gpm.txt
		;;
	*)
		echo "error: not a valid flag, use -h to help"
		;;
	esac
done

gum join "$(gp -m "$THIS_PETH" -b $COLORP)" "$(gp -m "$MESSAGE" -b $COLORP)"
