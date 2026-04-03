#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

mkdir -p $SCRIPT_DIR/vim/lua
mkdir -p $SCRIPT_DIR/vim/autoload
mkdir -p $SCRIPT_DIR/doom

cp ~/.zshrc $SCRIPT_DIR/zshrc
cp ~/.sbclrc $SCRIPT_DIR/sbclrc
cp -r ~/.config/nvim/* $SCRIPT_DIR/vim/
cp ~/.config/doom/* $SCRIPT_DIR/doom/

