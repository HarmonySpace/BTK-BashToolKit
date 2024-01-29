set_width=true
while true; do
  tW=$(tput cols)
  th=$(tput lines)
  if $set_width; then
    wl=$tW
    hl=$th
    set_width=false
  fi
  if [[ $tW -ne $wl || $th -ne $hl ]]; then
    clear
    set_width=true
  fi
  x=$(( (tW - 25) / 2 ))
  y=$(( th / 2 ))
  if [[ $y -gt 24 ]]; then
    y2=$(( (($y / 2) * 3) - 5 ))
  else
    y2=$(( $y + 7 ))
  fi
  current_time=$(date +"%H : %M : %S")
  try_catch "take date"
  printf "\033[%d;%dH $(date +"Año: %Y, Mes: %B, Día: %A, %d")" "$(( $y - 3 ))" "$(( $x - 8 ))" | lolcat
  try_catch "print day date"
  printf "\033[%dH$(figlet -f standard -w $(tput cols) -c "$current_time")" "$y" | lolcat
  try_catch "print hour date"
  printf "\033[%d;%dH <CTRL + c> para salir" "$y2" "$x" | lolcat
  try_catch "print out with"
  sleep 1
done
