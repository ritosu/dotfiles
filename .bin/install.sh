#!/usr/bin/env bash
set -ue

install_packages() {
    echo "install packages..."
    os=$(whichOS)

    if [ $os == "darwin" ]; then
	brew install zsh neovim tmux curl
    elif [ $os == "ubuntu" ]; then
        apt update \
        && apt -y upgrade \
        && apt install -y curl neovim software-properties-common tmux\
        && add-apt-repository ppa:fish-shell/release-3 && apt update && apt install -y fish    
    elif [ $os == "arch" ]; then
	pacman -Sy \
	&& pacman -S curl neovim tmux fish
    fi
    # install vim-plug for Unix,Linux 
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
	       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
}

link_to_homedir() {
    script_dir=$(cd $(dirname $0) && pwd -P)
    dotdir=$(dirname ${script_dir})
    if [[ $HOME != $dotdir ]];then
        for f in $dotdir/.??*;do
            [[ `basename $f` == ".git" ]] && continue
            if [[ -L "$HOME/`basename $f`" ]];then
                rm -f "$HOME/`basename $f`"
            fi
            if [[ -e "$HOME/`basename $f`" ]];then
                mv "$HOME/`basename $f`" "$HOME/.dotbackup"
            fi
            ln -snf $f $HOME
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
        elif [ -f /etc/arch-release ]; then
	    echo arch
	    return
	fi
    fi
}

echo "インストールを開始します"
link_to_homedir
install_packages
echo "インストールが終了しました。"
