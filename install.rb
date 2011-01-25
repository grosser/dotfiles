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

#replace files through links
%w[rspec bashrc gitignore irbrc nanorc].each do |file|
  original = "#{home}/.#{file}"
  `mv #{original} #{backup}/.#{file}`
  `ln -s #{dotfiles}/#{file} #{original}`
end

#replace bin folder through link
folder = 'bin'
`mv #{home}/#{folder} #{backup}/#{folder}`
`ln -s #{dotfiles}/#{folder} #{home}/#{folder}`

# merge credentials from old gitconfig with new
gitconfig = "#{home}/.gitconfig"
if File.exist?(gitconfig)
  credentials = extract_sections(gitconfig, ['[github]', '[user]']) + "\n\n"
  `mv #{gitconfig} #{backup}/.gitconfig`
end

new = File.read("#{dotfiles}/gitconfig").gsub('$HOME', home)
File.open(gitconfig,'w'){|f| f.write "#{credentials}#{new}" }