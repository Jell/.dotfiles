#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf "$DIR/bash_profile" ~/.bash_profile
ln -sf "$DIR/gemrc"        ~/.gemrc
ln -sf "$DIR/irbrc"        ~/.irbrc
ln -sf "$DIR/rvmrc"        ~/.rvmrc
ln -sf "$DIR/ctags"        ~/.ctags
ln -sf "$DIR/my.cnf"       ~/.my.cnf
ln -sf "$DIR/ackrc"        ~/.ackrc
ln -sf "$DIR/agignore"     ~/.agignore
ln -sf "$DIR/tmate.conf"   ~/.tmate.conf
ln -sf "$DIR/tmux.conf"    ~/.tmux.conf

# platform specific
case "$(uname -s)" in
  Linux*)
    ln -sf "$DIR/bashrc_linux"  ~/.bashrc
    ;;
  Darwin*)
    ln -sf "$DIR/bashrc_darwin" ~/.bashrc
    cp com.googlecode.iterm2.plist ~/Library/Preferences
    ;;
  *)
    echo "unsupported platform!"
    exit 1
    ;;
esac
