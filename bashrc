export PATH=~/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/sbin:/usr/X11/bin:/usr/bin:/sbin:/bin:/usr/local/sbin:$PATH

## Add path to rbenv
export PATH=~/.rbenv/bin:$PATH

## Path to firefox CLI
export PATH=/opt/homebrew-cask/Caskroom/firefox/latest/Firefox.app/Contents/MacOS:$PATH

## Rsense
export RSENSE_HOME='/usr/local/lib/rsense-0.3'

## TeX
export PATH=$PATH:/usr/texbin:/Library/TeX/texbin/

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

# unregister broken GHC packages. Run this a few times to resolve dependency rot in installed packages.
# ghc-pkg-clean -f cabal/dev/packages*.conf also works.
function ghc-pkg-clean() {
    for p in `ghc-pkg check $* 2>&1  | grep problems | awk '{print $6}' | sed -e 's/:$//'`
    do
        echo unregistering $p; ghc-pkg $* unregister $p
    done
}

# remove all installed GHC/cabal packages, leaving ~/.cabal binaries and docs in place
# When all else fails, use this to get out of dependency hell and start over
function ghc-pkg-reset() {
    read -p 'erasing all your user ghc and cabal packages - are you sure (y/n) ? ' ans
    test x$ans == xy && ( \
        echo 'erasing directories under ~/.ghc'; rm -rf `find ~/.ghc -maxdepth 1 -type d`; \
        echo 'erasing ~/.cabal/lib'; rm -rf ~/.cabal/lib; \
        echo 'erasing ~/.cabal/packages'; rm -rf ~/.cabal/packages; \
        echo 'erasing ~/.cabal/share'; rm -rf ~/.cabal/share; \
    )
}

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

#mysql path
export PATH=/usr/local/mysql/bin:$PATH

#SBT path
export PATH=~/Library/SBT/bin:$PATH

#Kestrel path
export PATH=~/Library/Kestrel/bin:$PATH

# Cask (previously carton)
export PATH=~/.cask/bin:$PATH

# lein bin path
export LEIN_HOME="$HOME/.lein"
export PATH=~/.lein/bin:$PATH

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_05.jdk/Contents/Home
export JRUBY_OPTS="-J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=2 -J-noverify -J-client -J-Djruby.memory.max=1024m -J-Xmx1024m -J-Dfile.encoding=utf8 -J-Djdk.certpath.disabledAlgorithms="
export JAVA_OPTS="-Xmx1024m -Dfile.encoding=utf8 -Djdk.certpath.disabledAlgorithms="

# more gittery
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
fi

function __git_info {
    local branch
    branch=$(git branch 2> /dev/null)
    test -z "$branch" && return
    branch=$(grep '^*' <<<"$branch" | cut -c3-)
    echo "[$branch]"
}

echo -ne "\033]0;${USER}@${HOSTNAME} at ${PWD}\007"

export CLICOLOR=1
export LSCOLORS=Exfxcxdxbxegedabagacad
export GREP_OPTIONS='--color=auto'

alias xdg-open='open'

Black='\[\e[0;30m\]'  # Black
Red='\[\e[0;31m\]'    # Red
Green='\[\e[0;32m\]'  # Green
Yellow='\[\e[0;33m\]' # Yellow
Blue='\[\e[0;34m\]'   # Blue
Purple='\[\e[0;35m\]' # Purple
Cyan='\[\e[0;36m\]'   # Cyan
White='\[\e[0;37m\]'  # White
DefaultColor='\[\e[0m\]'

function __happy_or_sad {
    if [ $? = 0 ];
    then printf "\e[0;32m(^,,^)";
    else printf "\e[0;31m(\/)_(;,,;)_(\/)WOOP!WOOP!WOOP!";
    fi
}

function __right_align {
    cols="${COLUMNS}"
    # Compensate for escape sequences
    pad=14
    cols=$(($cols+$pad))
    printf "%${cols}s\r" $1
}

export PROMPT_COMMAND=''
export PS1='$(__right_align "$(__happy_or_sad)\e[0;36m[\t]")'$Red'⎧ [\u@\h]'$Green'[$(rbenv version-name)]'$Cyan'[\w]'$Blue'$(__git_info)\n'$Red'⎪▸ '$DefaultColor
# Always start the prompt on the first column
#export PS1="\[\033[G\]$PS1"
export PS2=$Red'⎪▸ '$DefaultColor

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

alias ngs='JRUBY_OPTS="" ruby --ng-server'
alias ng='JRUBY_OPTS="$JRUBY_OPTS --ng"  $*'
alias nruby='JRUBY_OPTS="$JRUBY_OPTS --ng" ruby $*'
alias nrspec='ng rspec $*'

alias less='less -r'
alias bundlebinstubs='bundle install --binstubs .bundle/bin'
bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

complete -C ~/.dotfiles/thor_autocomplete -o default thor

# added by travis gem
[ -f /Users/Jell/.travis/travis.sh ] && source /Users/Jell/.travis/travis.sh
export LC_ALL=en_US.UTF-8


function docker-gc {
    docker images --quiet --filter "dangling=true" | xargs docker rmi;
    docker volume ls --quiet --filter "dangling=true" | xargs docker volume rm;
    echo "Cleaned up!";
}
