# Let's add some color to our lives
alias ls='ls --color=auto'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Because who has time for extra keystrokes?
alias l="ls -lAh"
alias ll="ls -lAh --ignore='.?*'"

# Quick access to your editor and pager—because who has time for extra keystrokes?
alias e='$EDITOR'
alias p='$PAGER'
# Also superpower editor
alias swim='sudo $EDITOR'

# The Holy Trinity of "Oops Prevention"
alias cp="cp -i"
alias mv="mv -i"
alias rm="rm -i"

# An alert for when your long-running commands finally decide to finish
# Use like so: "sleep 10; alert"
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Navigate up to the nearest Git repository—like a treasure hunt, but less exciting
cdgit() {
  local search_dir=".git"
  local current_dir="$PWD"

  while [[ "$current_dir" != "/" ]]; do
    if [[ -d "$current_dir/$search_dir" ]]; then
      cd "$current_dir"
      return 0
    fi
    current_dir="$(dirname "$current_dir")"
  done
  echo "No git repo found in parent directories."
  return 1
}

# For when your files need a timeout in the corner
baka() {
  if [ $# -eq 0 ]; then
    echo "Usage: baka <filename>"
    return 1
  fi
  local file="$1"
  if [ -e "$file" ]; then
    mv -i "$file" "${file}.baka"
    echo "Sent '$file' to the corner. It's '${file}.baka' now."
  else
    echo "Can't find '$file'. Is it hiding from its punishment?"
  fi
}
