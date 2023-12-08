#!/bin/bash

# print file browser
## file browser
function file_browser (){
  gum file --cursor "> " --all --cursor.foreground "$CL1" --directory.foreground "$CL2" --file.foreground "$FR" --selected.foreground "$CL1" "./"
  return 0
}

## custom file browser
function file_browser_custom (){
    ALL_this="${7}"
    if [[ $ALL_this = "true" ]]
    then
      ALL_this="--all"
    else
      ALL_this=""
    fi
    gum file "$ALL_this" --cursor "${1}" --cursor.foregound "${2}" --directory.foreground "${3}" --file.foreground "${4}" --selected.foreground "${5}" --directory "${6}"
    return 0
}

# export default
export FILE_SERVICES_LOADED=true