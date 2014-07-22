#!/usr/bin/env ruby
# backup files and replace

def backup_and_replace(dotfile, backup)
  # dotxxx -> home/.xxx
  if File.basename(dotfile) =~ /^dot/
    original = File.basename(dotfile).sub('dot','.')

  # translate magic comment in first lines
  elsif File.file?(dotfile) and File.readlines(dotfile)[0..1].join("\n") =~ %r{^(//|#)\->([/a-z\d\.]+)}
    original = $2

  else
    return
  end

  puts "linking #{dotfile} -> #{original}"

  move_file_to_backup(original, backup)
  sh "#{maybe_sudo(original)}ln -s #{dotfile} #{original}"
end

def maybe_sudo(file)
  'sudo ' if File.exist?(file) && !system("touch #{file}")
end

def move_file_to_backup(original, backup)
  return unless File.exist?(original)
  sh "#{maybe_sudo(original)}mv #{original} #{backup}/#{original.gsub('/', '-')}"
end

def add_include_to_gitconfig(dotfiles)
  gitconfig = ".gitconfig"
  File.write(gitconfig, "") unless File.exist?(gitconfig)
  if !File.read(gitconfig).include?("[include]")
    File.open(gitconfig, "a+") { |f| f.write "\n\n[include]\n  path=#{dotfiles}/gitconfig\n" }
  end
end

def create_backup_folder
  backup = "backup_dotfiles_#{Time.now.strftime('%Y-%m-%dT%H:%M:%S')}"
  sh "mkdir #{backup}"
  backup
end

def sh(command)
  result = `#{command}`
  raise "FAILED #{command}: #{result}" unless $?.success?
  result
end

dotfiles = File.expand_path(File.dirname(__FILE__))
raise "You must be in your home folder" unless Dir.pwd == File.expand_path('~')

expected = File.expand_path("~/dotfiles")
raise "dotfiles must be checked out as #{expected}" unless dotfiles == expected

backup = create_backup_folder

# backup and replace files through links
Dir["#{dotfiles}/*", "#{dotfiles}/secret/*"].each do |dotfile|
  backup_and_replace(dotfile, backup)
end

move_file_to_backup(".zshrc", backup)
add_include_to_gitconfig(dotfiles)

puts "Everything done!!"
