export EDITOR="ruco"
export PATH="~/bin:$PATH"
export JAVA_HOME="/usr/lib/jvm/java-6-openjdk"
export RUBYMINE_JDK="/usr/lib/jvm/java-6-sun/jre"
export GEM_OPEN_EDITOR=redcar
RBXOPT="-Xrbc.db" # do not clutter up everything with .rbc files when using rubinius

### HISTORY
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth


export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$HOME/.rbenv/versions/1.9.3-rc1/bin:$PATH"

# Load RVM if it is installed,
#  first try to load  user install
#  then try to load root install, if user install is not there.
#if [ -s "$HOME/.rvm/scripts/rvm" ] ; then
#  . "$HOME/.rvm/scripts/rvm"
#elif [ -s "/usr/local/rvm/scripts/rvm" ] ; then
#  . "/usr/local/rvm/scripts/rvm"
#fi
