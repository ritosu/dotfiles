# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/kenta-tanaka/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

eval "$(starship init zsh)"


alias ls='lsd'
alias l='ls -l'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

alias vi='nvim'
alias v='vi'

alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gpl='git pull'
alias gps='git push'
alias gl='git log -n 3'

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
