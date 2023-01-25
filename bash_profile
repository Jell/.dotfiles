if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion

# MacPorts Installer addition on 2013-10-20_at_14:00:44: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
export PATH="/usr/local/opt/apr/bin:$PATH"
export PATH="/usr/local/opt/apr-util/bin:$PATH"
export PATH="/usr/local/opt/ab/bin:$PATH"
export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
export PATH="/usr/local/opt/libpq/bin:$PATH"
[[ -f ~/.bashrc ]] && source ~/.bashrc # ghcup-env
[[ -f ~/.cargo/env ]] && source ~/.cargo/env
export PATH="$PATH:/Users/jell/.nsc/bin"

eval "$(rbenv init - bash)"

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/jell/bin/google-cloud-sdk/path.bash.inc' ]; then . '/Users/jell/bin/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/jell/bin/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/jell/bin/google-cloud-sdk/completion.bash.inc'; fi
