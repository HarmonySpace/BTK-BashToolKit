#!/bin/bash

sp() {
	gum spin $2 --spinner dot --spinner.foreground="$BLUE" --title.foreground "$WHITE" --title "$1"
}
