# can take advantage of ARGV, which git aliases cannot
# check in all changes with a message tat does not need quotes around it <-> lazy
def args_to_string(cmd)
  `#{cmd} "#{ARGV.join(' ').gsub('"','`')}"`
end