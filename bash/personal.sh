#Stuff that no-one else need, add and modify here to keep forks clean
alias m='mine .'
alias wrake="`which rake`" # rake without bundler
alias wruby="`which ruby`" # ruby without bundler
alias pryr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers" # pry as rails console, without pry as dependency
alias r="RBENV_VERSION=2.5.7 ruco"
alias t='testrbl'
alias r3t='BUNDLE_GEMFILE=Gemfile.rails3 t'
alias r3b='BUNDLE_GEMFILE=Gemfile.rails3 bundle'
alias st='spring test'
alias bo='bundle open'
alias bu='bundle update'
alias bp='bundle package --quiet'
alias tdd='date && tddium run --quiet'
alias tds='tddium status'
alias global-off='sudo mv /Applications/GlobalProtect{,OFF}.app && pkill -9 -f GlobalProtect && sudo pkill -9 -f PanGPS'
alias global-on='sudo mv /Applications/GlobalProtect{OFF,}.app'
alias casper-off='sudo mv /usr/local/jamf/bin/jamfAgent{,-off} ; sudo mv /usr/local/jamf/bin/jamf{,-off} ; sudo pkill -9 jamf'
alias casper-on='sudo mv /usr/local/jamf/bin/jamfAgent{-off,} ; sudo mv /usr/local/jamf/bin/jamf{-off,}'
alias game-on='global-off; casper-off'
alias game-off='global-on; casper-on'
alias kcm='sudo kubectl --context=master-devops'
alias kcs='sudo kubectl --context=staging-devops'
alias dst='docker rm -f $(docker ps -aq) >/dev/null 2>&1 || true'

function take(){
  mkdir $1;
  cd $1;
}

function pdf-decrypt(){
  qpdf --decrypt $1 $1.tmp && mv -f $1.tmp $1
}

export BUNDLER_EDITOR=mine
export GEM_EDITOR=mine

# Big app GC tuning
export RUBY_HEAP_MIN_SLOTS=1000000 # ruby < 2.1
export RUBY_GC_HEAP_INIT_SLOTS=1000000 # ruby 2.1+
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# GO
PATH="$HOME/.goenv/shims:$PATH"

# Rust
PATH="$HOME/.cargo/bin:$PATH"
