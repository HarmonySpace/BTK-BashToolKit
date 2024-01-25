#!/bin/bash

#import configuration
source ./services/imports.sh
source ./config.sh
try_catch_import $CONFIG_LOADED "importing < config.sh > file"
#check gum command
gum log "gum are running" > /dev/null 2> testing.log
try_catch "testing <gum> command"
#check 7zip instalation
