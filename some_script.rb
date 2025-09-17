# ...existing code...

def sh(cmd)
  success = system(cmd)
  unless success
    puts "Command failed: #{cmd}"
  end
  success
end

# ...existing code...

# Replace direct shell calls, e.g.:
# system("ls -l")
sh("ls -l")

# ...existing code...
# system("git pull")
sh("git pull")

# ...existing code...

