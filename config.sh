#!/bin/bash

#     search the file dirs
CONFIG_PATH=$(cd $EXEC_PATH && cd .. && pwd)

#     import
#   import enviroment
source $CONFIG_PATH/enviroment.sh
#   import yaml consults
#source $SERVICES_PATH/yq.sh
source $SERVICES_PATH/gp.sh
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
BLACK="$(echo "$(yq .colors.normal.black $theme_route)")"
RED="$(echo "$(yq .colors.normal.red $theme_route)")"
GREEN="$(echo "$(yq .colors.normal.green $theme_route)")"
YELLOW="$(echo "$(yq .colors.normal.yellow $theme_route)")"
BLUE="$(echo "$(yq .colors.normal.blue $theme_route)")"
MAGENTA="$(echo "$(yq .colors.normal.magenta $theme_route)")"
CYAN="$(echo "$(yq .colors.normal.cyan $theme_route)")"
WHITE="$(echo "$(yq .colors.normal.white $theme_route)")"
#   import a script element
# borders
BORDER="$(yq .borders.primary $theme_route)"
BORDER_NORMAL="$(yq .borders.normal $theme_route)"
# cursors
CURSOR="$(yq .cursors.primary $theme_route)"
CURSOR_NORMAL="$(yq .cursors.normal $theme_route)"
# spin
SPIN="$(yq .spin $theme_route)"
# profile
CHAR="$(yq .profile.primary $theme_route)"
CHAR_NORMAL="$(yq .profile.normal $theme_route)"
CHAR_HAPPY="$(yq .profile.happy $theme_route)"
CHAR_SAD="$(yq .profile.sad $theme_route)"

#   export default
export CONFIG_LOADED=true
