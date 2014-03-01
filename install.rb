#!/usr/bin/env ruby
# backup files and replace

def backup_and_replace(dotfile, home, backup)
  # dotxxx -> home/.xxx
  if File.basename(dotfile) =~ /^dot/
    file = File.basename(dotfile).sub('dot','.')
    original = "#{home}/#{file}"

  # translate magic comment in first lines
  elsif File.file?(dotfile) and File.readlines(dotfile)[0..1].join("\n") =~ %r{^(//|#)\->([/a-z\d\.]+)}
    original = $2

  else
    return
  end

  puts "linking #{dotfile} -> #{original}"

  prefix = move_file_to_backup(original, backup)
  sh "#{prefix} ln -s #{dotfile} #{original}"
end

def move_file_to_backup(original, backup)
  prefix = 'sudo' unless system("touch #{original}")
  if File.exist?(original)
    sh "#{prefix} mv #{original} #{backup}/#{original.gsub('/', '-')} 2>&1"
  end
  prefix
end

def add_include_to_gitconfig(home, dotfiles)
  gitconfig = "#{home}/.gitconfig"
  if File.exist?(gitconfig) && !File.read(gitconfig).include?("[include]")
    File.open(gitconfig, "a+") { |f| f.write "\n\n[include]\n  path=#{dotfiles}/gitconfig\n" }
  end
end

def create_bckup_folder(home)
  backup = "#{home}/backup_dotfiles_#{Time.now.strftime('%Y-%m-%dT%H:%M:%S')}"
  sh "mkdir #{backup}"
  backup
end

def sh(command)
  result = `#{command}`
  raise "FAILED #{command}: #{result}" unless $?.success?
  result
end

dotfiles = File.expand_path(File.dirname(__FILE__))
home = File.expand_path('~')

expected = "#{home}/dotfiles"
raise "dotfiles must be checked out as #{expected}" if expected != dotfiles

backup = create_bckup_folder(home)

# backup and replace files through links
Dir["#{dotfiles}/*", "#{dotfiles}/secret/*"].each do |dotfile|
  backup_and_replace(dotfile, home, backup)
end

move_file_to_backup("#{home}/.zshrc", backup)
add_include_to_gitconfig(home, dotfiles)

puts "Everything done!!"
