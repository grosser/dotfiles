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

dotfiles = File.expand_path(File.dirname(__FILE__))
home = File.expand_path('~')

expected = "#{home}/dotfiles"
raise "dotfiles must be checked out as #{expected}" if expected != dotfiles

# create backup folder
backup = "#{home}/dotfiles_backup_#{Time.now.strftime('%Y-%m-%dT%H:%M:%S')}"
`mkdir #{backup}`

# replace files through links (and backup old stuff)
Dir["#{dotfiles}/dot*", "#{dotfiles}/secret/dot*"].each do |dotfile|
  file = File.basename(dotfile).sub('dot','.')
  original = "#{home}/#{file}"
  `mv #{original} #{backup} 2>&1`
  `ln -s #{dotfile} #{original}`
end

# link bin files
`mv #{home}/bin #{backup} 2>&1`
`mkdir #{home}/bin 2>&1`
Dir["#{dotfiles}/bin/*", "#{dotfiles}/secret/bin/*"].each do |bin_file|
  `ln -s #{bin_file} #{home}/bin/#{File.basename(bin_file)}`
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
