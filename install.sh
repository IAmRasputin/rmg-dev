#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

safe_copy() {
    cp -ribS .bak $1 $2
}

mkdir -p $HOME/.config/nvim
mkdir -p $HOME/.config/doom
mkdir -p $HOME/.config/hypr

safe_copy $SCRIPT_DIR/zshrc $HOME/.zshrc
safe_copy $SCRIPT_DIR/sbclrc $HOME/.sbclrc
safe_copy $SCRIPT_DIR/vim/* $HOME/.config/nvim/
safe_copy $SCRIPT_DIR/doom/* $HOME/.config/doom/
safe_copy $SCRIPT_DIR/hypr/* $HOME/.config/hypr/
