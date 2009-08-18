My dotfiles, have a look, give me hints for improvement...

to use them all:
 - `cd ~ && git clone git://github.com/grosser/dotfiles.git`
 - `ruby dotfiles/install.rb`

install.rb will:
 - replaces .file through links to dotfiles/file for .bashrc .gitignore .irbrc
 - replace content of .gitconfig through this, except for [github] and [user] section
 - replace bin folder through link to dotfiles/bin