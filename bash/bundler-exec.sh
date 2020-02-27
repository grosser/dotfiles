#!/bin/bash

BUNDLED_COMMANDS="cucumber rackup rails ruby shotgun spec rspec cap knife sfn rake mtest rubocop"

## Functions

within-bundled-project()
{
    local dir=$PWD
    while [ $dir != "/" ]; do
        [ -f "$dir/Gemfile" ] && return 0
        dir="$(dirname $dir)"
    done
    return 1
}

run-with-bundler()
{
    local command="$1"
    shift
    if within-bundled-project; then
        if [ $command == "ruby" ]; then
          ruby -rbundler/setup "$@"
        else
          bundle exec $command "$@"
        fi
    else
        $command "$@"
    fi
}

## Main program

for CMD in $BUNDLED_COMMANDS; do
    alias $CMD="run-with-bundler $CMD"
done

# alias rubocop="ruby-cli-daemon rubocop"
# alias mtest="ruby-cli-daemon mtest"
# alias rake="ruby-cli-daemon rake"
