#!/usr/bin/env ruby
# -> run me with `ruby dotfiles/setup.rb`

raise "you should checkout dotfiles to ~/dotfiles and got to ~/ !" unless File.exist?("dotfiles")

#replace files through links
{
  '.bashrrc'=>'bashrc',
  '.gitignore'=>'gitignore',
  '.irbrc'=>'irbrc',
  '.ssh/config'=>'ssh/config'
}.each do |original,replaced|
  `rm -f #{original}`
  `ln -s ~/dotfiles/#{replaced} #{original}`
end

#replace folder through links
folder = 'bin'
`rm -rf #{folder}`
`ln -s ~/dotfiles/#{folder} #{folder}`

#do not share credentials + can always run install.rb
# --> replace non-secret lines
if File.exist?(".gitconfig")
  #extract github+user info from .gitconfig then combine with info stored here
  copy = false
  config = File.read('.gitconfig').split("\n")
  copied = config.map do |line|
    copy = false if line =~ /^\[/
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

