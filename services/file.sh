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
  if [[ $ALL_this = "true" ]]; then
    ALL_this="--all"
  else
    ALL_this=""
  fi
  gum file "$ALL_this" --cursor "${1}" --cursor.foregound "${2}" --directory.foreground "${3}" --file.foreground "${4}" --selected.foreground "${5}" --directory "${6}"
  return 0
}

# extract values
## search in file
function search_in_file (){
  grep "${1}" "${2}" | cut -d' ' -f${3}
}
## count interactions
function count_that (){
  grep -c "^${1}" "${2}"
}


# temp file
## put in temp.txt
function take_me (){
  TAKE=$(grep "${1} =" "${2}" | cut -d' ' -f${3})
  echo $TAKE >> $TEMP
}
## create a temp list
function take_me_list (){
  delete_temp
  while read -r line; do
    if [[ "$line" =~ "${1}" ]]; then
      TAKE=$(echo "$line" | cut -d' ' -f${3})
      echo $TAKE >> $TEMP
    fi
  done < "${2}"
  cat temp.txt
}
## delete temp file
function delete_temp (){
  cat /dev/null > $TEMP 
}


# export default
export FILE_SERVICES_LOADED=true
