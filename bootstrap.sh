#!/usr/bin/env bash
# version 1: works for my Gentoo machine

set -eu

if [[ ! -f "./zshrc" ]] || [[ ! -f "./vim/init.vim" ]]; then
    echo "Missing files, are you sure you're in the right place?"
    return 1
fi

# case statement against $OSTYPE I guess
function install_dependencies() {
    case "$(uname -s)" in
    esac
}

function maybe_replace() {
    if [[ -f "$2" ]]; then
        read -r -p "$2 already exists; replace it? [y/N] " response
        case "$response" in
            [yY][eE][sS]|[yY])
                cp "$1" "$2"
                ;;
            *)
                echo "Skipping."
                ;;
        esac
    fi
}

# just gonna start with one I guess
if [[ -f "/etc/gentoo-release" ]]; then
    # zsh
    maybe_replace "./zshrc" "$HOME/.zshrc"

    if [[ -f "$HOME/.oh-my-zsh" ]]; then
        read -r -p "OMZ already installed; reinstall it? [y/N] " response
        case "$response" in
            [yY][eE][sS]|[yY])
                sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
                ;;
            *)
                echo "Skipping."
                ;;
        esac
    fi

    # vim
    maybe_replace "./vim/init.vim" "$HOME/.config/nvim/init.vim"
    maybe_replace "./vim/config.lua" "$HOME/.config/nvim/lua/config.lua"

    # emacs
    if [[ -d "$HOME/.emacs.d/" ]]; then
        read -r -p "Emacs installed in legacy config directory (~/.emacs.d).  Migrate to ~/.config/emacs? [y/N] " response
        case "$response" in
            [yY][eE][sS]|[yY])
                ;;
            *)
                echo "Skipping."
                ;;
        esac
    fi

    if [[ -d "$HOME/.config/emacs" ]] || [[ -d "$HOME/.emacs.d" ]]; then
        read -r -p "(Doom) Emacs already installed; reinstall it? [y/N] " response
        case "$response" in
            [yY][eE][sS]|[yY])
                git clone --depth 1 https://github.com/doomemacs/doomemacs $HOME/.config/emacs
                $HOME/.config/emacs/bin/doom sync
                ;;
            *)
                echo "Skipping."
                ;;
        esac
    fi
fi

