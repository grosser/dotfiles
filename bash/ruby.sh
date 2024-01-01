# chruby or rbenv
if [ -e /opt/homebrew/opt/chruby ]; then
  source /opt/homebrew/opt/chruby/share/chruby/chruby.sh
  RUBIES+=(~/.rbenv/versions/*)
  source /opt/homebrew/opt/chruby/share/chruby/auto.sh
elif command -v rbenv >/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi

# Big app GC tuning
export RUBY_HEAP_MIN_SLOTS=1000000 # ruby < 2.1
export RUBY_GC_HEAP_INIT_SLOTS=1000000 # ruby 2.1+
export RUBY_HEAP_SLOTS_INCREMENT=1000000
export RUBY_HEAP_SLOTS_GROWTH_FACTOR=1
export RUBY_GC_MALLOC_LIMIT=1000000000
export RUBY_HEAP_FREE_MIN=500000

# make ruby installs fast by reusing openssl
# see `brew list openssl`
export RUBY_CONFIGURE_OPTS=--with-openssl-dir=/opt/homebrew/Cellar/openssl@3/3.2.0_1
