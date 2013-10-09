#Stuff that no-one else need, add and modify here to keep forks clean
alias m="mine . > /dev/null 2>&1 &"
alias wrake="`which rake`" # rake without bundler
alias wruby="`which ruby`" # ruby without bundler
alias pryr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers" # pry as rails console, without pry as dependency
alias r="rvm 2.0.0 exec ruco"
alias t='testrbl'
alias r3t='BUNDLE_GEMFILE=Gemfile.rails3 t'
alias r3b='BUNDLE_GEMFILE=Gemfile.rails3 bundle'
alias zt='zeus testrb'
alias bo='EDITOR=mine bundle open'
alias bu='bundle update'
alias go='EDITOR=mine gem open'
alias tdd='date && tddium run | tee /tmp/tdd.log'
alias global-off='sudo mv /Applications/GlobalProtect{,OFF}.app && pkill -9 -f GlobalProtect'
alias global-on='sudo mv /Applications/GlobalProtect{OFF,}.app'
alias casper-off='sudo mv /usr/sbin/jamfAgent{,-off} && sudo mv /usr/sbin/jamf{,-off} && sudo pkill -9 jamf'
alias casper-on='sudo mv /usr/sbin/jamfAgent{-off,} && sudo mv /usr/sbin/jamf{-off,}'

function take(){
  mkdir $1;
  cd $1;
}

function pdf-decrypt(){
  qpdf --decrypt $1 $1.tmp && mv -f $1.tmp $1
}

# Big app GC tuning
export RUBY_HEAP_MIN_SLOTS=1000000
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

function zd {
  ~/.zendesk/"${1}" "${2}"
}

eval "$(~/code/zendesk/z/bin/z init -)"

PATH="$HOME/.zendesk/bin:$HOME/.zendesk/sbin:$HOME/Applications/eclipse-adt/sdk/tools:$HOME/Applications/eclipse-adt/sdk/platform-tools/:$PATH"
