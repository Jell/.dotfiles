if [[ -s ~/.rvm/scripts/rvm ]] ; then source ~/.rvm/scripts/rvm ; fi

export PATH=~/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/sbin:/usr/X11/bin:/usr/bin:/sbin:/bin:/usr/local/sbin:$PATH

## Rsense
export RSENSE_HOME='/usr/local/lib/rsense-0.3'

##
# Your previous ~/.bash_profile file was backed up as ~/.bash_profile.macports-saved_2010-07-18_at_16:02:30
##
export ARCHFLAGS='-arch x86_64'

#devkitPRO
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=$DEVKITPRO/devkitARM

#haskell bins path
export PATH=~/Library/Haskell/bin:$PATH

# unregister broken GHC packages. Run this a few times to resolve dependency rot in installed packages.
# ghc-pkg-clean -f cabal/dev/packages*.conf also works.
function ghc-pkg-clean() {
    for p in `ghc-pkg check $* 2>&1  | grep problems | awk '{print $6}' | sed -e 's/:$//'`
    do
        echo unregistering $p; ghc-pkg $* unregister $p
    done
}

#mysql path
export PATH=/usr/local/mysql/bin:$PATH

#SBT path
export PATH=~/Library/SBT/bin:$PATH

#Kestrel path
export PATH=~/Library/Kestrel/bin:$PATH

# Carton
export PATH=~/.carton/bin:$PATH

# lein bin path
export LEIN_HOME="$HOME/.lein"
export PATH=~/.lein/bin:$PATH

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_11.jdk/Contents/Home
export JRUBY_OPTS="-J-XX:+TieredCompilation -J-XX:TieredStopAtLevel=2 -J-noverify -J-client -J-Djruby.memory.max=1024m -J-Xmx1024m -J-Dfile.encoding=utf8"
export JAVA_OPTS="-Xmx1024m -XX:MaxPermSize=256m -Dfile.encoding=utf8"

# more gittery
. /opt/local/share/doc/git-core/contrib/completion/git-completion.bash
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
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

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
export PS1='$(__right_align "$(__happy_or_sad)\e[0;36m[\t]")'$Red'⎧ [\u@\h]'$Green'[$(~/.rvm/bin/rvm-prompt v p g)]'$Cyan'[\w]'$Blue'$(__git_info)\n'$Red'⎪▸ '$DefaultColor
# Always start the prompt on the first column
#export PS1="\[\033[G\]$PS1"
export PS2=$Red'⎪▸ '$DefaultColor

# Jawaninja commands
#alias jawa-torrent='ssh jawaninja@jawaninja.com transmission-cli "$1" &'
alias jawa-torrent='ssh -X jawaninja@jawaninja.com firefox "http://localhost:9091/transmission/web/" &'
alias jawa-firefox='ssh -X jawaninja@jawaninja.com firefox &'
alias jawa-open='ssh -X jawaninja@jawaninja.com xdg-open . &'
alias jawa-term='ssh -X jawaninja@jawaninja.com gnome-terminal &'

alias emacs='open -a ~/Applications/Emacs.app "$@"'

export EDITOR=vim
export BUNDLER_EDITOR='open -a ~/Applications/Emacs.app "$@"'

# Fix for rvm that doesnt want to work properly
eval 'rvm use > /dev/null'
eval 'cd      > /dev/null'
eval 'cd -    > /dev/null'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
alias ll='ls -l'
alias l='ls'
alias matlab='matlab -nodisplay'

alias ngs='JRUBY_OPTS="" ruby --ng-server'
alias ng='JRUBY_OPTS="$JRUBY_OPTS --ng"  $*'
alias nruby='JRUBY_OPTS="$JRUBY_OPTS --ng" ruby $*'
alias nrspec='ng rspec $*'

alias less='less -r'

bind '"\e[A": history-search-backward'
bind '"\e[B": history-search-forward'
