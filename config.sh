#!/bin/bash

# search the file dirs
CONFIG_PATH=$(cd $EXEC_PATH && cd .. && pwd)

# source $CONFIG_PATH/themes/tokio-light.sh

#import all configuration files
source $CONFIG_PATH/enviroment.sh
source $CONFIG_PATH/services/file.sh
source $CONFIG_PATH/services/system.sh
source $CONFIG_PATH/services/logs.sh
source $CONFIG_PATH/services/prints.sh
source $CONFIG_PATH/services/choose.sh
source $CONFIG_PATH/services/filter.sh
source $CONFIG_PATH/services/input.sh
source $CONFIG_PATH/services/spin.sh
source $CONFIG_PATH/services/confirm.sh
source $CONFIG_PATH/services/user.sh
source $CONFIG_PATH/services/git.sh

# import a color theme
source "$CONFIG_PATH/themes/$(cat "$PREF_PATH" | grep "theme =" | cut -d"=" -f2 | sed 's/^[[:space:]]*//;s/[[:space:]]*$//').sh"
try_catch "import color theme"

# export default
export CONFIG_LOADED=true
