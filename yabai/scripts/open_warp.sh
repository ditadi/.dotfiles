if ! pgrep -f "Warp" > > /dev/null 2>&1; then
  open -a "/Applications/Warp.app"
else
  script='tell application "Warp" to create window with default profile'
  ! osascript -e "${script}" > /dev/null 2>&1 && {
    while IFS="" read -r pid; do
      kill -15 "${pid}"
    done < <(pgrep -f "Warp")
    open -a "/Applications/Warp.app" 
  }
