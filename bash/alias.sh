# General
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cdd="cd -" #go to last used directory
alias shutdown-vms="VBoxManage list vms | cut -f 1 -d ' ' | xargs -I NAME sh -c 'VBoxManage controlvm NAME poweroff ; VBoxManage unregistervm NAME' ; rm -rf ~/VirtualBox\ VMs/*"
alias reberks="rm -f Berksfile.lock && bundle exec berks"
alias cp='cp -iv'
alias mv='mv -iv'
alias rmdir='rmdir -v'
alias ln='ln -v'
alias ls='ls -Gh'
alias grep='grep --color=auto'

f(){ find . -iname "*$1*"; }

function git-find-merge() {
  git rev-list $1..master --ancestry-path | grep -f <(git rev-list $1..master --first-parent) | tail -1
}

#Ubuntu
# alias install="sudo apt-get install"
# alias remove="sudo apt-get remove"
# alias erase="wipe -crqQ1" # rename + overwrite + remove files

#GIT
function master() {
  ([[ -z $(git branch --list master) ]] && git checkout main) || git checkout master
}

#Rails
alias ttr="touch tmp/restart.txt"

# RUBY
alias be="bundle exec"
alias b="bundle check 2>&1 > /dev/null || { ((test -d vendor/cache && bundle --local --quiet) || bundle --quiet) || bundle check > /dev/null; }"
alias bl="bundle --local --quiet"
alias bul="bundle update --local"
alias bundle-grep='bundle show --paths | sed "s+$PWD/++" | xargs grep --recursive --line-number --'
