#!/usr/bin/env ruby
# -> run me with `ruby dotfiles/setup.rb`

raise "you should checkout dotfiles to ~/dotfiles and got to ~/ !" unless File.exist?("dotfiles")

#replace files through links
{
  '.rspec'=>'rspec',
  '.bashrc'=>'bashrc',
  '.gitignore'=>'gitignore',
  '.irbrc'=>'irbrc'
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
  #replace any $HOME with actual $HOME (since $HOME does not work in gitconfig)
  original = File.read('dotfiles/gitconfig')
  original.gsub!('$HOME', `echo $HOME`.strip)

  #extract github+user info from .gitconfig then combine with info stored here
  copy = false
  config = File.read('.gitconfig').split("\n")
  copied = config.map do |line|
    copy = false if line =~ /^\[/
    copy = true if %w{[github] [user]}.include? line.strip
    line if copy
  end.compact.reject{|x| x.empty?}


  File.open('.gitconfig','w') do |f|
    f.puts copied * "\n"
    f.puts ''
    f.puts original
  end
else
  `cp dotfiles/gitconfig .gitconfig`
end

