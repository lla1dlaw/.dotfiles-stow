# completion options
setopt auto_menu menu_complete    # completes the first menu match
setopt auto_param_slash           # append '/' postfix for directorys
setopt no_case_glob no_case_match # better globbing
setopt glob_dots extended_glob    # glob dotfiles and match ~ # and ^ characters
setopt interactive_comments       # allow comments in interactive shell
setopt prompt_sp                  # don't autoclean blanklines
# history setup 
HISTFILE="$XDG_CACHE_HOME/.zsh/zsh_history"
HISTSIZE=10000
SAVEHIST=10000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt inc_append_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# completion config
zstyle ':completion:*' menu select # tab opens cmp menu
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}" ma=0\;33 # colrize menu (magic shit at the end idk)
zstyle ':completion:*' squeeze-slashes false # allows for /*/ to expand

# general highlight styles
(( ${+ZSH_HIGHLIGHT_STYLES} )) || typeset -A ZSH_HIGHLIGHT_STYLES # recomended before messing with styles
ZSH_HIGHLIGHT_STYLES[path]='none'
ZSH_HIGHLIGHT_STYLES[path_prefix]='none'

DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS="true"
DISABLE_COMPFIX="true"
