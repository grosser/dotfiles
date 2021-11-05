#!/usr/bin/env ruby
#
# put this file into your path and use `<file> install` to add a new hook
# or use it as a binary to check changed files

require 'shellwords'

if ARGV == ["install"]
  exec "ln", "-sf", __FILE__, ".git/hooks/pre-commit"
else
  raise unless ARGV == []
end

changed = `git status --porcelain`.
  split("\n").
  map { |l| l.split(" ", 2) }.
  select { |status, _| ["A", "AM", "M"].include?(status) }. # changed, not deleted
  map { |_, file| file.delete('"') } # remove extra quotes from git

exit if changed.empty?

if File.exist?(".standard.yml")
  exec "bundle exec standardrb #{changed.shelljoin}"
else
  parallel = ((File.read(".rubocop.yml").include?("UseCache: false") rescue false) ? "" : " --parallel")
  exec "bundle exec rubocop #{parallel} --color --force-exclusion #{changed.shelljoin}"
end
