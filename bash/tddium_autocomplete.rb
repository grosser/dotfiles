#!/usr/bin/env ruby

# Autocomplete tddium for bash
# Save it somewhere and then add
# complete -C path/to/script -o default tddium
# to your ~/.bashrc

def available_tasks
  task_lines = `tddium --help`.split("\n")
  inside_tasks = false
  task_lines.map do |line|
    inside_tasks = true and next if line == "Tasks:"
    inside_tasks = false and next if inside_tasks and line =~ /^\S/
    line.strip.split(/\s+/)[1] if inside_tasks
  end.compact
end

def cache(file)
  file = File.expand_path(file)
  if File.exist?(file)
    Marshal.load File.read(file)
  else
    cached = yield
    raise unless system("mkdir -p #{File.dirname(file)}")
    File.open(file, "w"){ |f| f.write(Marshal.dump(cached)) }
    cached
  end
end

exit 0 unless /^tddium\b/ =~ ENV["COMP_LINE"]

require "tddium/version"
tasks = cache("~/.autocomplete-cache/tddium-#{TddiumVersion::VERSION}"){ available_tasks }
puts tasks.grep(/^#{$'.strip}/)
