#!/bin/bash

#import configuration
source ./services/imports.sh
source ./config.sh
try_catch_import $CONFIG_LOADED "importing < config.sh > file"
#start the program
log_info info "starting script"
#check dependencies
log_info info "checking dependencies"
source ./dependencies.sh
#creatind dir
log_info info "creating a <bin> DIR"
mkdir -p "$HOME/bin"
try_catch "<bin> DIR created"
log_info info "conpressing files"



