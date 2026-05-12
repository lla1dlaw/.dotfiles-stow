
function commit_and_push() {
  # combination of gcam and gp (git commit all with message and git push)
  if [ -z "$1" ]; then
    echo "Usage: commit_and_push \"Your commit message\""
    return 1
  fi
  git add . && git add --all && git commit -m "$1" && git push
}

# Opens the files passed to it with xdg-open. 
# If 10 or more files are selected, the function asks for confirmation before opening. 
function open() {
    if [[ $# -gt 10 ]]; then
        echo -n "You are about to open $# files. Are you sure? (y/n): "
        read -k 1 res
        echo "" # Move to a new line
        [[ "$res" != "y" ]] && return 1
    fi

    for file in $@; do
        # Opens each file, silences all output, and backgrounds/disowns
        xdg-open "$file" > /dev/null 2>&1 &|
    done
}

# custom functions
take() {
  mkdir -p "$1"
  cd "$1"
}

# Define a custom widget that tries to accept a suggestion; if none, it tabs normally
function expand-or-complete-with-dots() {
  if [[ -n "$POSTDISPLAY" ]]; then
    zle autosuggest-accept
  else
    zle expand-or-complete
  fi
}
zle -N expand-or-complete-with-dots
bindkey '^I' expand-or-complete-with-dots
