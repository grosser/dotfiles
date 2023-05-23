# General
alias shutdown-vms="VBoxManage list vms | cut -f 1 -d ' ' | xargs -I NAME sh -c 'VBoxManage controlvm NAME poweroff ; VBoxManage unregistervm NAME' ; rm -rf ~/VirtualBox\ VMs/*"
alias reberks="rm -f Berksfile.lock && bundle exec berks"
alias dive="docker run -ti --rm  -v /var/run/docker.sock:/var/run/docker.sock wagoodman/dive"

# cd helpers
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias cdd="cd -" # go to last used directory

# Colorful defaults
alias cp='cp -iv'
alias mv='mv -iv'
alias rmdir='rmdir -v'
alias ln='ln -v'
alias ls='ls -Gh'
alias grep='grep --color=auto'

# Find file by name in current folder
f(){ find . -iname "*$1*"; }

function git-find-merge() {
  git rev-list $1..master --ancestry-path | grep -f <(git rev-list $1..master --first-parent) | tail -1
}

# GIT
function master() {
  ([[ -n $(git branch --list main) ]] && git checkout main) || git checkout master
}

# Rails
alias ttr="touch tmp/restart.txt"

# RUBY
alias be="bundle exec"
alias bundle-grep='bundle show --paths | sed "s+$PWD/++" | xargs grep --recursive --line-number --'
