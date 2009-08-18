source ~/dotfiles/bash/env
source ~/dotfiles/bash/settings
source ~/dotfiles/bash/misc
source ~/dotfiles/bash/git_prompt
source ~/dotfiles/bash/rake_autocomplete




###### ALIASES

alias install="sudo apt-get install"
alias remove="sudo apt-get remove"

# RUBY
alias ss="script/server"
alias sc="script/console"
alias sa="autospec -f"


# MISC
alias ttr="touch tmp/restart.txt"
alias t="tail -f"
alias devlog="tail -f log/development.log"
alias g?="grep -e $1"
alias kj="killall java"
alias kf="killall firefox"
alias mys="mysql -uroot -proot"

#PROJECTS
alias da="cd /apps/dawanda"
alias rs="cd /apps/rs"

# SVN
alias svn_add_new="svn st | egrep '^\?[ ]+' | sed -e 's|^?[ ]*||' | xargs -i svn add '{}'"
alias svn_rm_new="svn st | egrep '^\?[ ]+' | sed -e 's|^?[ ]*||' | xargs -i rm '{}'"
alias svn_rm_missing="svn st | egrep '^\![ ]+' | sed -e 's|^![ ]*||' | xargs -i svn rm '{}'"

#GEMS
alias gemi='sudo gem install --no-rdoc --no-ri'
alias gemu='sudo gem uninstall'

#GIT
alias work='git co work'
alias master='git co master'

alias c="clear"
