#!/usr/bin/env ruby
# -> run me with `ruby dotfiles/setup.rb`

no_backup = ENV['NO_BACKUP']

raise "you should checkout dotfiles to ~/dotfiles and got to ~/ !" unless File.exist?("dotfiles")

#replace files through links
{
  '.bashrrc'=>'bashrc',
  '.gitignore'=>'gitignore',
  '.irbrc'=>'irbrc',
  '.ssh/config'=>'ssh/config'
}.each do |original,replaced|
  if File.exist?(original)
    if no_backup
      `rm -f #{original}`
    else
      `mv #{original} #{original}.backup`
    end
  end
  `ln -s dotfiles/#{replaced} #{original}`
end

#replace folder through links
folder = 'bin'
if File.exist?(folder)
  if no_backup
    `rm -rf #{folder}`
  else
    `mv #{folder} #{folder}.backup`
  end
end
`ln -s dotfiles/#{folder} #{folder}`

#do not share credentials + can always run install.rb
# --> replace non-secret lines
if File.exist?(".gitconfig")
  `cp .gitconfig .gitconfig.backup` unless no_backup

  #extract github+user info from .gitconfig then combine with info stored here
  copy = false
  config = File.read('.gitconfig').split("\n")
  copied = config.map do |line|
    copy = false if line =~ /\[[a-z]+\]/
    copy = true if "[github] [user]".include? line.strip
    line if copy
  end.compact.reject{|x| x.empty?}

  File.open('.gitconfig','w') do |f|
    f.puts copied * "\n"
    f.puts ''
    f.puts File.read('dotfiles/gitconfig')
  end
else
  `cp dotfiles/gitconfig .gitconfig`
end

