#!/bin/bash

# search the file dirs
CONFIG_PATH=$(cd $SCRIPT_DIR && cd .. && pwd)

#import all configuration files
source $CONFIG_PATH/enviroment.sh
source $CONFIG_PATH/colors.sh
source $CONFIG_PATH/services/system.sh
source $CONFIG_PATH/services/logs.sh
source $CONFIG_PATH/services/prints.sh
source $CONFIG_PATH/services/choose.sh
source $CONFIG_PATH/services/input.sh
source $CONFIG_PATH/services/spin.sh
source $CONFIG_PATH/services/file.sh
source $CONFIG_PATH/services/user.sh
source $CONFIG_PATH/services/git.sh

# export default
export CONFIG_LOADED=true
