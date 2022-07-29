#!/usr/bin/env bash
set -ue

helpmsg() {
    command echo "Usage: $0 [--help | h ]" 0>&2
    command echo ""
}

install_packages() {
    command echo "install packages..."
    os=$(whichOS)

    if [ $os == "Darwin" ]; then
	command brew install zsh neovim tmux curl
    elif [ $os == "ubuntu" ]; then
	command apt-get install -y zsh neovim tmux curl
    else
	return 0;
    fi
    mkdir .local
    curl -o .local/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
}

link_to_homedir() {
    command echo "backup old dotfiles..."
    if [ ! -d "$HOME/.dotbackup" ];then
        command echo "$HOME/.dotbackup not found. Auto Make it"
        command mkdir "$HOME/.dotbackup"
    fi

    local script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
    local dotdir=$(dirname ${script_dir})
    if [[ "$HOME" != "$dotdir" ]];then
        for f in $dotdir/.??*;do
            [[ `basename $f` == ".git" ]] && continue
            if [[ -L "$HOME/`basename $f`" ]];then
                command rm -f "$HOME/`basename $f`"
            fi
            if [[ -e "$HOME/`basename $f`" ]];then
                command mv "$HOME/`basename $f`" "$HOME/.dotbackup"
            fi
            command ln -snf $f HOME
        done
    else
        command echo "same install src dest"
    fi
}

whichOS() {
    os=$(uname)
    if [ $os == "Darwin" ]; then
        echo darwin
        return
    elif [ $os == "Linux" ]; then
        if [ -f /etc/lsb-release ]; then
            echo ubuntu
            return
        fi
    else
        command echo "this os is not supported."
    fi
}

link_to_homedir
install_packages
git config --global include.path "~/.gitconfig_shared"
command echo -e "\e[1;36m Install completed!!! \e[m"
