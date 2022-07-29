source ~/.local/git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWSTASHSTATE=true
GIT_PS1_SHOWNTRACKEDFILES=true
GIT_PS1_SHOWUPSTREEAM=auto

setopt PROMPT_SUBST ; PS1='%F{red}$(__git_ps1 "(%s)")%f'

PROMPT="$(echo $PS1) %F{green}%~%f "

alias v="nvim"
alias vi="nvim"
alias vim="nvim"
alias view="nvim -R"
alias ll="ls -lha"
