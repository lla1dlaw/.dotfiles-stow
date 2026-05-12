
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# source zsh configuration file
ZSH_CONFIG_DIR="$HOME/.zsh"
source "$ZSH_CONFIG_DIR/env.zsh"
source "$ZSH_CONFIG_DIR/options.zsh"
source "$ZSH_CONFIG_DIR/plugins.zsh"
source "$ZSH_CONFIG_DIR/functions.zsh"
source "$ZSH_CONFIG_DIR/aliases.zsh"
source "$ZSH_CONFIG_DIR/tools.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh. 
P10K_PATH="$ZSH_CONFIG_DIR/.p10k.zsh"
[[ ! -f "$P10K_PATH" ]] || source "$P10K_PATH"
