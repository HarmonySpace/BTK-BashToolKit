#!/bin/bash

# print confirm

## basic spin
function confirm_yn() {
  gum confirm --selected.foreground="$BG" --prompt.foreground="$CL1" --unselected.foreground="$CL1" --affirmative="yes" --negative="no" --default "${1}" && echo "yes" || echo "no"
  return 0
}
function confirm_git() {
  source "$SCRIPTS/../scripts/gitcli/status.sh"
  add_in $temp1 "$(echo continue = $(confirm_yn "¿Continuar?"))"
  if_null $(search_in $temp1 "continue" = 2)
  if [[ "$(search_in $temp1 "continue" = 2)" = "no" ]]; then
    print_montseSad "git switch cancelado"
    exit 2
  fi
}

# export default
export CONFIRM_SERVICES_LOADED=true
