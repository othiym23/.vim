#!/bin/bash

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

        if [ X"${source}" != X"${stat_output}" ]
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

if type brew &> /dev/null && brew info ctags | grep -q 'Not installed'
then
    echo "Installing Exuberant ctags via Homebrew."
    brew install ctags > /dev/null
elif type apt-get &> /dev/null && ! dpkg -s exuberant-ctags &> /dev/null
then
    echo "Installing Exuberant ctags via apt-get (will need your password)."
    sudo apt-get install exuberant-ctags > /dev/null
fi

if type cabal &> /dev/null && ! cabal info lushtags &> /dev/null
then
    echo "Installing lushtags via cabal."
    cabal update > /dev/null
    cabal install lushtags > /dev/null
fi

echo "Setting up configuration file links."

# Set up .vimrc, preserving the existing one
preserve_config ".vimrc" ".vim/vimrc"
# ...same goes for .gvimrc...
preserve_config ".gvimrc" ".vim/gvimrc"
# ...and my ctags configuration.
preserve_config ".ctags" ".vim/resources/ctags.conf"

cd ~/.vim

echo "Installing Plugins."
vim -es -u vimrc -i NONE -c "PlugInstall" -c "qa"

echo "Setting up Command-T."

if type rvm &>/dev/null
then
    [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
    rvm use system
fi

cd ~/.vim/bundle/command-t/ruby/command-t

if type asdf &>/dev/null
then
    asdf set ruby system
fi

if type rbenv &>/dev/null
then
    rbenv local system
fi

ruby extconf.rb > /dev/null
make > /dev/null

if type asdf &>/dev/null
then
    rm .tool-versions
fi

if type rbenv &>/dev/null
then
    rm .ruby-version
fi
