#Stuff that no-one else need, add and modify here to keep forks clean
alias kj="pkill -f java"
alias kf="pkill -f firefox"
alias m="mine . > /dev/null 2>&1 &"
alias wrake="`which rake`" # rake without bundler
alias wruby="`which ruby`" # ruby without bundler
alias pryr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers" # pry as rails console, without pry as dependency
alias r="rvm 1.9.3 exec ruco"
alias skype-restart="killall -9 skype && video-skype"
alias pmaster='current=`git branch 2> /dev/null | sed -e "/^[^*]/d" -e "s/* \(.*\)/\1/"` && git co master && git pull --rebase && (bundle check || bundle) && rake db:migrate db:test:prepare && git co db/*.sql && git co $current && git rebase master'
alias t='testrbl'
alias zt='zeus testrb'
alias bo='EDITOR=mine bundle open'
alias go='EDITOR=mine gem open'
alias tdd='date && rm -rf .tddium && tddium run' # tddium messes up it's branch knowledge too often...

function take(){
  mkdir $1;
  cd $1;
}

function pdf-decrypt(){
  qpdf --decrypt $1 $1.tmp && mv -f $1.tmp $1
}

# ZenDesk specific
export RUBY_HEAP_MIN_SLOTS=300000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000

function zd {
  ~/.zendesk/"${1}" "${2}"
}

PATH="$HOME/.zendesk/bin:$HOME/.zendesk/sbin:$PATH"
