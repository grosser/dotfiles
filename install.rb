#!/usr/bin/env ruby
# backup files and replace

def extract_sections(file, sections)
  copy = false
  config = File.read(file).split("\n")
  config.map do |line|
    copy = false if line =~ /^\[/
    copy = true if sections.include? line.strip
    line if copy
  end.compact.reject(&:empty?) * "\n"
end

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

  prefix = 'sudo' unless system("touch #{original}")
  `#{prefix} mv #{original} #{backup}/#{original.gsub('/','-')} 2>&1`
  `#{prefix} ln -s #{dotfile} #{original}`
end

dotfiles = File.expand_path(File.dirname(__FILE__))
home = File.expand_path('~')

expected = "#{home}/dotfiles"
raise "dotfiles must be checked out as #{expected}" if expected != dotfiles

# create backup folder
backup = "#{home}/dotfiles_backup_#{Time.now.strftime('%Y-%m-%dT%H:%M:%S')}"
`mkdir #{backup}`

# backup and replace files through links
Dir["#{dotfiles}/*", "#{dotfiles}/secret/*"].each do |dotfile|
  backup_and_replace(dotfile, home, backup)
end

# gitconfig
# merge credentials from old gitconfig with new
gitconfig = "#{home}/.gitconfig"
if File.exist?(gitconfig)
  credentials = extract_sections(gitconfig, ['[github]', '[user]']) + "\n\n"
  `mv #{gitconfig} #{backup}/.gitconfig`
end

new = File.read("#{dotfiles}/gitconfig").gsub('$HOME', home)
File.open(gitconfig,'w'){|f| f.write "#{credentials}#{new}" }

puts "Everything done!!"
