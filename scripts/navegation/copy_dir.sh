add_in $temp1 "$(echo actual_dir = $(pwd))"
if_null "$(search_in $temp1 "actual_dir" = 2)"
print_montseHappy "Dirección actual $(search_in $temp1 "actual_dir" = 2)"
search_in $temp1 "actual_dir" = 2 | xclip -selection clipboard
if [[ "$TERM" == *"kitty"* ]]; then
  search_in $temp1 "actual_dir" = 2 | kitty +kitten clipboard
fi
try_catch "copy dir"