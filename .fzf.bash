# Setup fzf
# ---------
if [[ ! "$PATH" == */Users/jem.hilton/.fzf/bin* ]]; then
  export PATH="$PATH:/Users/jem.hilton/.fzf/bin"
fi

# Man path
# --------
if [[ ! "$MANPATH" == */Users/jem.hilton/.fzf/man* && -d "/Users/jem.hilton/.fzf/man" ]]; then
  export MANPATH="$MANPATH:/Users/jem.hilton/.fzf/man"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/Users/jem.hilton/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/Users/jem.hilton/.fzf/shell/key-bindings.bash"

