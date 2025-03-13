#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sf "$DIR/bash_profile" ~/.bash_profile
ln -sf "$DIR/gemrc"        ~/.gemrc
ln -sf "$DIR/irbrc"        ~/.irbrc
ln -sf "$DIR/ctags"        ~/.ctags
ln -sf "$DIR/my.cnf"       ~/.my.cnf
ln -sf "$DIR/ackrc"        ~/.ackrc
ln -sf "$DIR/agignore"     ~/.agignore
ln -sf "$DIR/tmate.conf"   ~/.tmate.conf

# platform specific
case "$(uname -s)" in
  Linux*)
    ln -sf "$DIR/bashrc_linux"    ~/.bashrc
    ln -sf "$DIR/bash_aliases"    ~/.bash_aliases
    ln -sf "$DIR/tmux_linux.conf" ~/.tmux.conf
    ;;
  Darwin*)
    ln -sf "$DIR/bashrc_darwin"    ~/.bashrc
    ln -sf "$DIR/tmux_darwin.conf" ~/.tmux.conf
    cp com.googlecode.iterm2.plist ~/Library/Preferences
    ;;
  *)
    echo "unsupported platform!"
    exit 1
    ;;
esac
