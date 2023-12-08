#!/bin/bash

# watermark
function water (){
  print_key "$(cat $SCRIPT_DIR/../ascii.txt)"
  return 0
}

# export default
export USER_SERVICES_LOADED=true