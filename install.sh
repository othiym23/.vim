#!/bin/sh

cd ~

mv .vimrc .vimrc-
ln -sf .vim/vimrc .vimrc
mv .gvimrc .gvimrc-
ln -sf .vim/gvimrc .gvimrc
