#!/usr/bin/env bash
set -ue

install_packages() {
	echo "install packages..."
    os=$(whichOS)

	if [ $os == "Darwin" ]; then
	    brew install zsh neovim tmux curl
    elif [ $os == "ubuntu" ]; then
        sudo apt update && sudo apt -y upgrade && sudo apt install -y zsh neovim tmux curl
	else
	    return 0;
	fi
	mkdir .local
	curl -o .local/git-prompt.sh https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh
}

link_to_homedir() {
    if [ ! -d "$HOME/.dotbackup" ];then
        mkdir "$HOME/.dotbackup"
    fi

    script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd -P)"
    dotdir=$(dirname ${script_dir})
    if [[ "$HOME" != "$dotdir" ]];then
        for f in $dotdir/.??*;do
            [[ `basename $f` == ".git" ]] && continue
            if [[ -L "$HOME/`basename $f`" ]];then
                rm -f "$HOME/`basename $f`"
            fi
            if [[ -e "$HOME/`basename $f`" ]];then
                mv "$HOME/`basename $f`" "$HOME/.dotbackup"
            fi
            ln -snf $f HOME
        done
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
    fi
}

install_packages
link_to_homedir
git config --global include.path "~/.gitconfig_shared"
command echo -e "\e[1;36m Install completed!!! \e[m"
