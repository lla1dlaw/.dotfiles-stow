# aliases
alias ls='eza --color=always --group-directories-first --icons -l'
alias borah='$HOME/bash_scripts/borah_login.exp'
alias falcon='$HOME/bash_scripts/falcon_login.exp'
alias gcamp='commit_and_push'
alias c='clear'
alias vmdash='$HOME/bash_scripts/vmdash_login.exp'
alias python='python3'
alias gl='glab'

if command -v rg &> /dev/null; then alias grep='rg'; fi
eval "$(thefuck --alias)"
# batcat command is different on different linux distros
if grep -q "ID=fedora" /etc/os-release; then
  alias cat='bat'
elif grep -q "ID_LIKE=debian" /etc/os-release || grep -q "ID=ubuntu" /etc/os-release || grep -q "ID=linuxmint" /etc/os-release; then
  alias cat='batcat'
else
  alias cat='batcat'
fi
