# General
#alias t="tail -f"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cdd="cd -" #go to last used directory
alias l="ls -lah" #ls all+long+humanized filesizes
f(){ find -name "*$1*"; }
function run() {
  number=$1
  shift
  for i in `seq $number`; do
    $@
  done
}


#Ubuntu
alias install="sudo apt-get install"
alias remove="sudo apt-get remove"
alias erase="wipe -crqQ1" # rename + overwrite + remove files

# SVN
alias svn_add_new="svn st | egrep '^\?[ ]+' | sed -e 's|^?[ ]*||' | xargs -i svn add '{}'"
alias svn_rm_new="svn st | egrep '^\?[ ]+' | sed -e 's|^?[ ]*||' | xargs -i rm '{}'"
alias svn_rm_missing="svn st | egrep '^\![ ]+' | sed -e 's|^![ ]*||' | xargs -i svn rm '{}'"

#GIT
alias work='git co work'
alias master='git co master'
alias deploy='git co deploy'

#Rails
alias ttr="touch tmp/restart.txt"
alias ss="script/server"
alias sc="script/console"
alias sg="script/generate"

# RUBY
alias sa="autospec -f" #run autospec without the initial full run
alias be="bundle exec"
alias bi="bundle install"
alias b="bundle check 2>&1 > /dev/null || { bundle --quiet || bundle check > /dev/null; } && bundle exec"
alias bo="EDITOR=mine bundle open"
alias nob-ruby="`which ruby`" # ruby without bundler
alias ge="EDITOR=mine gem edit"

#GEMS
alias gemi='sudo gem install --no-rdoc --no-ri'
alias gemu='sudo gem uninstall'
