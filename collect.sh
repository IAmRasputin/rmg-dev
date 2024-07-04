#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir -p $SCRIPT_DIR/vim/lua
mkdir -p $SCRIPT_DIR/vim/autoload
mkdir -p $SCRIPT_DIR/doom
mkdir -p $SCRIPT_DIR/hypr

cp ~/.zshrc $SCRIPT_DIR/zshrc
cp ~/.config/nvim/init.vim $SCRIPT_DIR/vim/
cp ~/.config/nvim/lua/config.lua $SCRIPT_DIR/vim/lua/
cp ~/.config/nvim/autoload/* $SCRIPT_DIR/vim/autoload/
cp ~/.config/doom/* $SCRIPT_DIR/doom/
cp -r ~/.config/hypr/* $SCRIPT_DIR/hypr/

