if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi
source "`brew --prefix grc`/etc/grc.bashrc"

##
# Your previous /Users/Jell/.bash_profile file was backed up as /Users/Jell/.bash_profile.macports-saved_2013-10-20_at_14:00:44
##

# MacPorts Installer addition on 2013-10-20_at_14:00:44: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

