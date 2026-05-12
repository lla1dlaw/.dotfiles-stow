
# plugin manager spec
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d "$ZINIT_HOME" ]; then # install zinit if it's data directory is not found
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# zinit plugins
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
function zvm_config() {
  ZVM_LINE_INIT_MODE=$ZVM_MODE_INSERT
  ZVM_VI_INSERT_ESCAPE_BINDKEY=jk
  ZVM_INIT_MODE=sourcing
}
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode
ZVM_CLIPBOARD_ENABLED=true

# auto load competions
autoload -Uz compinit && compinit
autoload -U colors && colors

# prompt setup
zinit ice depth="1"
zinit light romkatv/powerlevel10k
