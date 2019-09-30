#! /bin/bash
# support Ubuntu and macOS

platform=$(uname)

install=
sudo=sudo
copy=
[ "$(whoami)" = "root" ] && sudo=

prepare_package() {
    printf "############### Install packages ###############\n"

    packages="neovim git tmux thefuck wget axel unrar tree zsh neofetch htop binutils pv coreutils"
    if [ "$platform" = "Linux" ]; then
        packages="$packages curl locales exuberant-ctags packagekit-command-not-found command-not-found python-pip libsecret-1-0 libsecret-1-dev ruby-dev npm xz-utils terminator python-pygments"

        install="$sudo apt-get -y install "
        copy="cp -arT"

        $sudo apt update
        $sudo snap install lsd
    elif [ "$platform" = "Darwin" ]; then
        export HOMEBREW_NO_AUTO_UPDATE=1

        [ -z "$(command -v brew)" ] && \
            /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

        packages="$packages reattach-to-user-namespace ctags node xz lsd fd python rust"
        cask_packages="font-hack-nerd-font iterm2 pref-setter"

        install="brew install"
        copy="ditto"

        brew tap homebrew/cask-fonts
        brew tap homebrew/command-not-found
        brew cask install $cask_packages
    else
        printf "Unsupported platform: $platform"
        exit 1
    fi

    echo "$install $packages" | bash

    [ "$platform" = "Linux" ] && locale-gen "en_US.UTF-8"
}

setup_nvim() {
    printf "###############  nvim ###############\n"
    mkdir -pv ~/.config/nvim

    cat <<EOF > ~/.config/nvim/init.vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath=&runtimepath
source ~/.vimrc
EOF

    $copy nvim ~

    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
    vim -c "PluginInstall" -c "qa"

    mv ~/.vimrc_complete ~/.vimrc

    mkdir -pv $HOME/.vim/undo
}

setup_zsh() {
    printf "############### zsh ###############\n"
    mkdir -pv ~/.antigen
    curl -L git.io/antigen > ~/.antigen/antigen.zsh

    $copy zsh ~

    zsh -ic 'print Hello zsh'
    mv ~/powerlevel10k.zsh-theme.patch ~/.antigen/bundles/romkatv/powerlevel10k/
    cd ~/.antigen/bundles/romkatv/powerlevel10k
    patch -p1 < powerlevel10k.zsh-theme.patch
    cd -
}

setup_git() {
    printf "############### git ###############\n"
    if [ "$platform" = "Linux" ]; then
        cd /usr/share/doc/git/contrib/credential/libsecret
        $sudo make
        cd -
        git config --global credential.helper /usr/share/doc/git/contrib/credential/libsecret/git-credential-libsecret
    else # macOS
        git config --global credential.helper osxkeychain
    fi

    $copy git ~
}

setup_misc() {
	printf "############### misc ###############\n"

    [ ! -d ~/.mark ] && mkdir ~/.mark
    echo "export LC_ALL=en_US.UTF-8" >> ~/.bashrc
    echo "export LANG=en_US.UTF-8" >> ~/.bashrc


    # tmux
    $copy tmux ~
    if [ "$platform" = "Darwin" ]; then
        echo "set-option -g default-command \"reattach-to-user-namespace -l zsh\"" >> ~/.tmux.conf
    fi
    echo "set-option -g default-shell $(which zsh)" >> ~/.tmux.conf

    # nerd-font
    if [ "$platform" = "Linux" ]; then
        mkdir -pv ~/.local/share/fonts
        curl -O -L https://github.com/ryanoasis/nerd-fonts/releases/download/v2.0.0/UbuntuMono.zip
        [ -f "UbuntuMono.zip" ] && {
            unzip UbuntuMono.zip -d ~/.local/share/fonts && rm UbuntuMono.zip
            fc-cache -f -v

            printf "==> Use UbuntuMono Nerd Font Regular for terminal.\n\n"
        }
    fi

    if [ "$platform" = "Darwin" ]; then
        # iterm2
        cp -a misc/com.googlecode.iterm2.plist ~/Library/Preferences/
        defaults read -app iTerm

        # python related
        pip3 install Pygments

        # rebuild lsd with music icon replaced for iTerm users
        # see: https://github.com/Peltoche/lsd/issues/134
        git clone --depth=1 https://github.com/wcnz2018/lsd
        cd lsd && cargo build --release && cp ./target/release/lsd /usr/local/bin/lsd && cd -
        rm -rf lsd
    fi

    # npm
    $sudo npm install -g http-server
}

prepare_package
setup_nvim
setup_zsh
setup_git
setup_misc
