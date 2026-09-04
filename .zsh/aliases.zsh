# aliases
alias ls='eza --color=always --group-directories-first --icons -l'
alias gcamp='commit_and_push'
alias c='clear'
alias python='python3'
alias gl='glab'
alias bios='systemctl reboot --firmware-setup'

eval "$(thefuck --alias)"
# batcat command is different on different linux distros
if grep -q "ID=fedora" /etc/os-release; then
  alias cat='bat'
elif grep -q "ID_LIKE=debian" /etc/os-release || grep -q "ID=ubuntu" /etc/os-release || grep -q "ID=linuxmint" /etc/os-release; then
  alias cat='batcat'
else
  alias cat='batcat'
fi
