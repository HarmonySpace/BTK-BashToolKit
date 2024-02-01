#!/bin/bash

#     search the file dirs
CONFIG_PATH=$(cd $EXEC_PATH && cd .. && pwd)
#     add services shortcuts
OLD_PATH=$PATH
export PATH="$CONFIG_PATH/services/shortcuts:$PATH"


#     import
#   import enviroment
source $CONFIG_PATH/enviroment.sh
#   import yaml consults
#source $SERVICES_PATH/gp.sh
#source $SERVICES_PATH/system.sh
#source $SERVICES_PATH/file.sh
#source $SERVICES_PATH/logs.sh
#source $SERVICES_PATH/choose.sh
#source $SERVICES_PATH/filter.sh
#source $SERVICES_PATH/input.sh
#source $SERVICES_PATH/spin.sh
#source $SERVICES_PATH/confirm.sh
#source $SERVICES_PATH/user.sh
#source $SERVICES_PATH/git.sh

#     import means
#   import a color theme
# take theme name
theme_route="$CONFIG_PATH/themes/$(yq .theme $PREF_PATH).yaml"
# import colors from theme.yaml
export BLACK="$(echo "$(yq .colors.normal.black $theme_route)")"
export RED="$(echo "$(yq .colors.normal.red $theme_route)")"              #errors
export GREEN="$(echo "$(yq .colors.normal.green $theme_route)")"          #user
export YELLOW="$(echo "$(yq .colors.normal.yellow $theme_route)")"        #warnings
export BLUE="$(echo "$(yq .colors.normal.blue $theme_route)")"            #key
export MAGENTA="$(echo "$(yq .colors.normal.magenta $theme_route)")"      #file
export CYAN="$(echo "$(yq .colors.normal.cyan $theme_route)")"            #second key
export WHITE="$(echo "$(yq .colors.normal.white $theme_route)")"          #message
#   import a script element
# borders
export BORDERS="$(yq .borders.primary $theme_route)"
export BORDERS_NORMAL="$(yq .borders.normal $theme_route)"
# cursors
export CURSOR="$(yq .cursors.primary $theme_route)"
export CURSOR_NORMAL="$(yq .cursors.normal $theme_route)"
# spin
export SPIN="$(yq .spin $theme_route)"
# profile
export CHAR="$(yq .profile.primary $theme_route)"
export CHAR_NORMAL="$(yq .profile.normal $theme_route)"
export CHAR_HAPPY="$(yq .profile.happy $theme_route)"
export CHAR_SAD="$(yq .profile.sad $theme_route)"

#     add services shortcuts
OLD_PATH=$PATH
export PATH="$CONFIG_PATH/services/shortcuts:$PATH"


