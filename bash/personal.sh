#Stuff that no-one else need, add and modify here to keep forks clean
alias m='mine $(pwd) > /dev/null 2>&1 &'
alias wrake="`which rake`" # rake without bundler
alias wruby="`which ruby`" # ruby without bundler
alias pryr="pry -r ./config/environment -r rails/console/app -r rails/console/helpers" # pry as rails console, without pry as dependency
alias r="(which rvm && rvm 2.0.0 exec ruco) || RBENV_VERSION=2.3.1 ruco"
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
alias casper-off='sudo mv /usr/sbin/jamfAgent{,-off} && sudo mv /usr/sbin/jamf{,-off} && sudo pkill -9 jamf'
alias casper-on='sudo mv /usr/sbin/jamfAgent{-off,} && sudo mv /usr/sbin/jamf{-off,}'
alias game-on='global-off; casper-off'
alias game-off='global-on; casper-on'
alias kcm='sudo kubectl --context=master-devops'
alias kcs='sudo kubectl --context=staging-devops'

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

# Docker
export DOCKER_HOST=tcp://192.168.42.45:2375
export ZENDESK_REGISTRY_PUSH_PATH=registry.docker.zdsys/grosser
export DOCKER_VM_MEMORY=4096 # remove when on 16g machine

# GO
export GOPATH=$HOME/Code/go
PATH="$HOME/Code/go/bin:$PATH"

# Rust
PATH="$HOME/.cargo/bin:$PATH"

