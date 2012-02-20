#!/bin/sh

cd ~

mv .vimrc .vimrc-
ln -sf .vim/vimrc .vimrc
mv .gvimrc .gvimrc-
ln -sf .vim/gvimrc .gvimrc

cd ~/.vim

# make sure that submodules are correctly configured
git submodule init
git submodule update
git submodule sync
