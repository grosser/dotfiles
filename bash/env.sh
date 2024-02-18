if [[ $HOME == "/Users/mgrosser" ]]; then
  export EDITOR="ruco" # local
else
  export EDITOR="nano" # server
fi
export PATH="$HOME/.krew/bin:$PATH"
export PATH="$HOME/dotfiles/bin:$PATH"
export PATH="$HOME/dotfiles/secret/bin:$PATH"
export PATH="/usr/local/bin:$PATH"

#if [ -f /usr/libexec/java_home ]; then
#  export JAVA_HOME=$(/usr/libexec/java_home)
#fi
export CLICOLOR=1 # colors for e.g. ls on mac
export RBXOPT="-Xrbc.db" # do not clutter up everything with .rbc files when using rubinius

# HISTORY https://sanctum.geek.nz/arabesque/better-bash-history
export HISTSIZE=1000000 # size of history
export HISTCONTROL=ignorespace:ignoredups # ignore duplicates, cmds beginning with space

eval "HISTIGNORE+=" 2>/dev/null && # if HISTIGNORE is writeable (avoid noise on remote hosts)
  export HISTIGNORE='ls:ll:cd:pwd:bg:fg:history' # ignore useless commands
export HISTTIMEFORMAT='%F %T ' # show when commands were executed

# Ignore mail
unset -v MAIL;
unset -v MAIL_WARNING;

# in case-sensitive autocompletion
tty -s && bind 'set completion-ignore-case on' 2>/dev/null
