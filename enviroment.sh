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

export WS=$(($(tput cols) - 2))
export WSD2=$(($WS / 2))
export WSD4=$(($WSD2 / 2))
export WSD4X3=$(($WSD4 * 3))
export HS=$(($(tput lines) - 2))
export HSD2=$(($HS / 2))
export HSD4=$(($HSD2 / 2))
export HSD4X3=$(($HSD4 * 3))

# export WM=$(($(tput cols) / 2))
# mwidth=$(($(tput cols) / 2)) && mwidth=$(($mwidth / 2)) && mwidth=$(($mwidth * 3))
# export WMM=$mwidth
# export WT=$(tput cols)
# export HT=$(tput lines)
