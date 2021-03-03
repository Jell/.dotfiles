#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -s "$DIR/bash_profile" ~/.bash_profile
ln -s "$DIR/bashrc"       ~/.bashrc
ln -s "$DIR/gemrc"        ~/.gemrc
ln -s "$DIR/irbrc"        ~/.irbrc
ln -s "$DIR/rvmrc"        ~/.rvmrc
ln -s "$DIR/ctags"        ~/.ctags
ln -s "$DIR/my.cnf"       ~/.my.cnf
ln -s "$DIR/ackrc"        ~/.ackrc
ln -s "$DIR/agignore"     ~/.agignore
ln -s "$DIR/tmate.conf"   ~/.tmate.conf
ln -s "$DIR/tmux.conf"    ~/.tmux.conf

cp com.googlecode.iterm2.plist ~/Library/Preferences
