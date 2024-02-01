#!/bin/bash

# enviroments vars
export SEP="◣◥◣◥◤◢◤◢◣◥◣◥◤◢◤◢◣◥◣◥◤◢◤◢◣◥◣◥◤◢◤◢◣◥◣◥◤◢◤◢◣◥◣◥◤◢◤◢◣◥◣◥◤◢◤◢◣◥◣◥◤◢◤◢"
export SEC="<<>><<>><<>><<>>"
export SEC2="•······························•"
export SEC3=" -"

export SCRIPT_PATH="$EXEC_PATH/../scripts"
export TEMP_PATH="$CONFIG_PATH/temp"
export PREF_PATH="$CONFIG_PATH/btk.yaml"
export ROUTES_PATH="$CONFIG_PATH/routes.ini"
export SERVICES_PATH="$CONFIG_PATH/services"

export WM=$(($(tput cols) / 2))
mwidth=$(($(tput cols) / 2)) && mwidth=$(($mwidth / 2)) && mwidth=$(($mwidth * 3))
export WMM=$mwidth
export WT=$(tput cols)
export HT=$(tput lines)

