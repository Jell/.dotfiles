if [[ -s /Users/Jell/.rvm/scripts/rvm ]] ; then source /Users/Jell/.rvm/scripts/rvm ; fi

export PATH=/Users/Jell/bin:/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/sbin:/usr/X11/bin:/usr/bin:/sbin:/bin

##
# Your previous /Users/Jell/.bash_profile file was backed up as /Users/Jell/.bash_profile.macports-saved_2010-07-18_at_16:02:30
##
export ARCHFLAGS='-arch x86_64'

#devkitPRO
export DEVKITPRO=/opt/devkitpro
export DEVKITARM=$DEVKITPRO/devkitARM


#mysql path
export PATH=/usr/local/mysql/bin:$PATH

#pig path
export PATH=/Users/Jell/Documents/relepig/pig-0.6.0/bin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

export PATH=/usr/local/texlive/2011/bin/x86_64-darwin:$PATH

#flood path
export PATH=/Users/Jell/Documents/flood:$PATH

#faxian path
export PATH=/Users/Jell/Library/Faxien/bin:$PATH

#SBT path
export PATH=/Users/Jell/Library/SBT/bin:$PATH

#Kestrel path
export PATH=/Users/Jell/Library/Kestrel/bin:$PATH

export PATH=/Users/Jell/Library/Storm/bin:$PATH

export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home


function __pwd2 {
  local wd pd
  wd=$(pwd)
  #wd=${PWD/$HOME/\~}
  pd=${wd%/*}
  echo ${pd##*/}/${wd##*/}
}

# more gittery
. /opt/local/share/doc/git-core/contrib/completion/git-completion.bash
function __git_info {
  local branch
  branch=$(git branch 2> /dev/null)
  test -z "$branch" && return
  branch=$(grep '^*' <<<"$branch" | cut -c3-)
  echo ":$branch"
}


echo -ne "\033]0;${USER}@${HOSTNAME} at ${PWD}\007"

alias ls='ls -G'
alias xdg-open='open'
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM function

export PS1='\[\e[1;31m\][\u@\h]\[\e[1;32m\][$(~/.rvm/bin/rvm-prompt v p g)]\e[1;36m\][\w]\n\[\e[0m\]\W$(__git_info) \$ '


# Jawaninja commands
#alias jawa-torrent='ssh jawaninja@jawaninja.com transmission-cli "$1" &'
alias jawa-torrent='ssh -X jawaninja@jawaninja.com firefox "http://localhost:9091/transmission/web/" &'
alias jawa-firefox='ssh -X jawaninja@jawaninja.com firefox &'
alias jawa-open='ssh -X jawaninja@jawaninja.com xdg-open . &'
alias jawa-term='ssh -X jawaninja@jawaninja.com gnome-terminal &'

alias emacs="/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs -nw"

export EDITOR=/usr/local/Cellar/emacs/HEAD/Emacs.app/Contents/MacOS/Emacs

# Fix for rvm that doesnt want to work properly
eval 'cd'
eval 'cd -'
