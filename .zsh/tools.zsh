# conda init 
__conda_setup="$('/home/liam/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/liam/miniconda3/etc/profile.d/conda.sh" ]; then
    else
        export PATH="/home/liam/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup

# fzf history setup 
source <(fzf --zsh)

# zoxide
eval "$(zoxide init --cmd cd zsh)"

# nvm config
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# linuxbrew shell environment setup
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
