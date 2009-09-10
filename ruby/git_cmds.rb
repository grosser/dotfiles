# variouse git comands that are stored here, so they can take advantage of ARGV
# which normal git alias does not have
# and because I dont like unix functions ...

# perform some operation on matching files from `git st`
def git_perform_on_st(find, execute)
  st = `git st`
  lines = st.split("\n").select{|x|x=~/#{find}/}
  files = lines.map{|x|x.split(' ')[2]}
  files.each{|f| eval("`#{execute.gsub('#F', f)}`")}
end

# check in all changes with a message tat does not need quotes around it <-> lazy
def args_to_string(cmd)
  `#{cmd} "#{ARGV.join(' ').gsub('"','`')}"`
end