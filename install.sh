#!/bin/sh

set -e

preserve_config () {
    local target=$1
    local source=$2

    local stat_output=''

    if [ -e "${target}" ]
    then
        if stat --version > /dev/null 2>&1 && \
            stat --version 2>&1 | grep -q GNU
        then
            # GNU stat
            stat_output=$(stat -c '%N' "${target}" | sed "s/^.* -> \`\(.*\)'$/\1/")
        else
            # for now, just assume we're on a BSD-like system
            stat_output=$(stat -f '%Y' "${target}")
        fi

        if [ -e "${target}" -a X"${source}" != X"${stat_output}" ]
        then
            mv "${target}" "${target}-"
        fi
    fi

    if [ ! -e "${target}" ]
    then
        ln -s "${source}" "${target}"
    fi
}

cd ~

# Set up .vimrc, preserving the existing one
preserve_config ".vimrc" ".vim/vimrc"
# ...same goes for .gvimrc...
preserve_config ".gvimrc" ".vim/gvimrc"
# ...and my ctags configuration.
preserve_config ".ctags" ".vim/resources/ctags.conf"

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
