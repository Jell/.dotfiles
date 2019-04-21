export PATH=~/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/sbin:/usr/X11/bin:/usr/bin:/sbin:/bin:/usr/local/sbin:$PATH

## Add path to rbenv
export PATH=~/.rbenv/bin:$PATH

## Path to firefox CLI
export PATH=/opt/homebrew-cask/Caskroom/firefox/latest/Firefox.app/Contents/MacOS:$PATH

## Rsense
export RSENSE_HOME='/usr/local/lib/rsense-0.3'

## TeX
export PATH=$PATH:/usr/texbin:/Library/TeX/texbin

## Go bins
export PATH=$PATH:~/go/bin/

##
# Your previous ~/.bash_profile file was backed up as ~/.bash_profile.macports-saved_2010-07-18_at_16:02:30
##
export ARCHFLAGS='-arch x86_64'

#devkitPRO
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=$DEVKITPRO/devkitARM

#haskell bins path
export PATH=~/Library/Haskell/bin:$PATH

# Add cabal bin path
export PATH=~/.cabal/bin:$PATH

# GPG crap
GPG_TTY=$(tty)
export GPG_TTY

# Sync prod before deploy
function sync-prod() {
    git checkout master;
    git pull;
    git checkout prod;
    git pull;
    git merge master -m "merging master into prod";
    git push origin prod;
    git checkout master;
}

# lein bin path
export LEIN_HOME="$HOME/.lein"
export PATH=~/.lein/bin:$PATH

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_05.jdk/Contents/Home
export JRUBY_OPTS="-J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=2 -J-noverify -J-client -J-Djruby.memory.max=1024m -J-Xmx1024m -J-Dfile.encoding=utf8 -J-Djdk.certpath.disabledAlgorithms="
export JAVA_OPTS="-Xmx1024m -Dfile.encoding=utf8 -Djdk.certpath.disabledAlgorithms="

# Completion
if [ -f "$(brew --prefix)/etc/bash_completion" ]; then
  # shellcheck source=/dev/null
  . "$(brew --prefix)/etc/bash_completion"
fi

bind 'set show-all-if-ambiguous on'

function __git_info {
    local branch
    branch=$(git branch 2> /dev/null)
    test -z "$branch" && return
    branch=$(grep '^\*' <<<"$branch" | cut -c3-)
    echo "[$branch]"
}

echo -ne "\\033]0;${USER}@${HOSTNAME} at ${PWD}\\007"

export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
export GREP_OPTIONS='--color=auto'

alias xdg-open='open'

# Black='\[\e[0;30m\]'
# Red='\[\e[0;31m\]'
Green='\[\e[0;32m\]'
# Yellow='\[\e[0;33m\]'
Blue='\[\e[0;34m\]'
# Purple='\[\e[0;35m\]'
Cyan='\[\e[0;36m\]'
# White='\[\e[0;37m\]'
DefaultColor='\[\e[0m\]'

function __happy_or_sad {
    if [ $? = 0 ];
    then printf "\\e[0;32m(^,,^)";
    else printf "\\e[0;31m(\\/)_(;,,;)_(\\/)WOOP!WOOP!WOOP!";
    fi
}

function __right_align {
    cols="${COLUMNS}"
    # Compensate for escape sequences
    pad=14
    cols=$((cols+pad))
    printf "%${cols}s\\r" "$1"
}

export PROMPT_COMMAND=''
export PS1='$(__right_align "$(__happy_or_sad)\[\e[0;36m\][\t]")'$Green'⎧ [\u@\h]'$Cyan'[\w]'$Blue'$(__git_info)\n'$Green'⎪▸ '$DefaultColor
# Always start the prompt on the first column
#export PS1="\[\033[G\]$PS1"
export PS2=$Green'⎪▸ '$DefaultColor

# Jawaninja commands
#alias jawa-torrent='ssh jawaninja@jawaninja.com transmission-cli "$1" &'
alias jawa-torrent='ssh -X jawaninja@jawaninja.com firefox "http://localhost:9091/transmission/web/" &'
alias jawa-firefox='ssh -X jawaninja@jawaninja.com firefox &'
alias jawa-open='ssh -X jawaninja@jawaninja.com xdg-open . &'
alias jawa-term='ssh -X jawaninja@jawaninja.com gnome-terminal &'

alias emacs='emacsclient -c'

export EDITOR=vim
export BUNDLER_EDITOR=ecc

alias ll='ls -l'
alias l='ls'
alias matlab='matlab -nodisplay'

alias less='less -r'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

if command -v rbenv > /dev/null; then eval "$(rbenv init -)"; fi

complete -C ~/.dotfiles/thor_autocomplete -o default thor

export LC_ALL=en_US.UTF-8

alias travis='docker run --rm -v $PWD:/repo -v ~/.travis:/travis andredumas/travis-ci-cli'

alias runbash='docker-compose run --rm bash'
### Functions for setting and getting environment variables from the OSX keychain ###
### Adapted from https://www.netmeister.org/blog/keychain-passwords.html ###

# Use: keychain-environment-variable SECRET_ENV_VAR
function keychain-environment-variable () {
    security find-generic-password -w -a "${USER}" -D "environment variable" -s "${1}"
}

# Use: set-keychain-environment-variable SECRET_ENV_VAR
#   provide: super_secret_key_abc123
function set-keychain-environment-variable () {
    [ -n "$1" ] || printf "Missing environment variable name"

    read -r -s -p "Enter Value for ${1}: " secret

    [ -n "$1" ] && [ -n "$secret" ] || return 1
    security add-generic-password -U -a "${USER}" -D "environment variable" -s "${1}" -w "${secret}"
}

GITHUB_REPO_ADMIN="$(keychain-environment-variable GITHUB_REPO_ADMIN)"
export GITHUB_REPO_ADMIN
