#!/bin/bash

# enviroments vars
export SEP="◣◥◣◥◤◢◤◢◣◥◣◥◤◢◤◢◣◥◣◥◤◢◤◢◣◥◣◥◤◢◤◢◣◥◣◥◤◢◤◢◣◥◣◥◤◢◤◢◣◥◣◥◤◢◤◢◣◥◣◥◤◢◤◢"
export SEC="<<>><<>><<>><<>>"
export SEC2="•······························•"
export SEC3=" -"

export TEMP_DIR="$CONFIG_PATH/temp"
export CONFIG_PREF="$CONFIG_PATH/config.ini"

export WM=$(($(tput cols) / 2))
mwidth=$(($(tput cols) / 2)) && mwidth=$(($mwidth / 2)) && mwidth=$(($mwidth * 3))
export WMM=$mwidth

# export default
export ENVIROMENT_LOADED=true
