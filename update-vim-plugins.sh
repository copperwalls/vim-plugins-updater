#!/bin/bash
# -- update-vim-plugins.sh ----------------------------------------------------
#
# This program comes with no warranty. Use at your own risk.
# You have been warned. (That said, it works well for me :)
#
# Copyright (c) 2012 ed.o
# include 'MIT-License.txt'
#
# See https://github.com/copperwalls/vim-plugins-updater
#
# ------------------------------------------------------------------------------
shopt -s -o nounset

# Default path
# (You probably know what you’re doing if you need to change this)
declare -rx DOTVIM_DIR="$HOME/.vim"

cd "$DOTVIM_DIR"

git submodule -q foreach git pull -q origin master

MODIFIED_PLUGINS=$(git status | grep 'modified.*bundle' | cut -d ' ' -f 4)

if [ -n "$MODIFIED_PLUGINS" ]; then
    for PLUGIN in $MODIFIED_PLUGINS
    do
        git add $PLUGIN
        echo "$PLUGIN was updated."
    done
fi

#
# All done! Happy hacking!
# ---------------------------------------------------------------------- ed.o --
