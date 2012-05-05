export EDITOR="ruco"
export PATH="~/dotfiles/bin:~/dotfiles/secret/bin:/usr/local/bin:$PATH"
export JAVA_HOME="/usr/lib/jvm/java-6-openjdk"
export RUBYMINE_JDK="/usr/lib/jvm/java-6-sun/jre"
export GEM_OPEN_EDITOR=redcar
export CLICOLOR=1 # colors for e.g. ls on mac
RBXOPT="-Xrbc.db" # do not clutter up everything with .rbc files when using rubinius

### HISTORY
# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups
# ... and ignore same sucessive entries.
export HISTCONTROL=ignoreboth
