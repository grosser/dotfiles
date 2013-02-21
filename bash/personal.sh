#Stuff that no-one else need, add and modify here to keep forks clean
alias m="mine . > /dev/null 2>&1 &"
alias wrake="`which rake`" # rake without bundler
alias wruby="`which ruby`" # ruby without bundler
alias pryr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers" # pry as rails console, without pry as dependency
alias r="rvm 1.9.3 exec ruco"
alias t='testrbl'
alias zt='zeus testrb'
alias bo='EDITOR=mine bundle open'
alias bu='bundle update'
alias go='EDITOR=mine gem open'
alias tdd='date && tddium run'
alias global-off='sudo mv /Applications/GlobalProtect{,OFF}.app && pkill -9 -f GlobalProtect'
alias global-on='sudo mv /Applications/GlobalProtect{OFF,}.app'

function take(){
  mkdir $1;
  cd $1;
}

function pdf-decrypt(){
  qpdf --decrypt $1 $1.tmp && mv -f $1.tmp $1
}

# Big app GC tuning
export RUBY_HEAP_MIN_SLOTS=300000
export RUBY_HEAP_SLOTS_INCREMENT=250000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=50000000

function zd {
  ~/.zendesk/"${1}" "${2}"
}

eval "$(/Users/mgrosser/code/zendesk/z/bin/z init -)"

PATH="$HOME/.zendesk/bin:$HOME/.zendesk/sbin:$PATH"
