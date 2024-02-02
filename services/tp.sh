#!/bin/bash

# init temp files
mTemp() {
	dTemp
	mkdir -p "$TEMP_PATH"
}

# delete temp files
dTemp() {
	rm -rf "$TEMP_PATH"
}

# create a temp files
cTemp() {
	mktemp "$TEMP_PATH/tempXXX.yaml"
}
