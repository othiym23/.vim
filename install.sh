#!/bin/sh
set -e

cd ~

if [ X".vim/vimrc" != X`stat -f '%Y' ~/.vimrc` ]
then
    mv .vimrc .vimrc-
    ln -sf .vim/vimrc .vimrc
fi

if [ X".vim/gvimrc" != X`stat -f '%Y' ~/.gvimrc` ]
then
    mv .gvimrc .gvimrc-
    ln -sf .vim/gvimrc .gvimrc
fi

if [ X".vim/resources/ctags.conf" != X`stat -f '%Y' ~/.ctags` ]
then
    mv .ctags .ctags-
    ln -sf .vim/resources/ctags .ctags
fi

cd ~/.vim

# make sure that submodules are correctly configured
git submodule init
git submodule sync
git submodule update

# set up snippets
mkdir -p snippets/javascript
cd snippets/javascript
for snippet in ../../resources/snipmate-nodejs/snippets/javascript/*.snippet
do
    if [ ! -e `basename $snippet` ]
    then
        ln -s $snippet .
    fi
done
