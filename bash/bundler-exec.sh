#!/bin/bash

BUNDLED_COMMANDS="cucumber rackup rails ruby shotgun spec rspec cap knife sfn rake mtest rubocop"

## Functions

within-bundled-project()
{
    local dir=$PWD
    while true; do
        [ -f "$dir/Gemfile" ] && return
        dir="$(dirname $dir)"
        [ $dir == "/" ] && return 1
    done
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
