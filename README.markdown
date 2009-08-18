My dotfiles, have a look, give me hints for improvement...

Install
=======
    cd ~ && git clone git://github.com/grosser/dotfiles.git

Manual Install
--------------
For all files you need
    ln -s dotfiles/xxx .xxx

Automatic install
-----------------
    ruby dotfiles/install.rb

install.rb will:
 - replaces .file through links to dotfiles/file for .bashrc .gitignore .irbrc
 - replace content of .gitconfig through this, except for [github] and [user] section
 - replace bin folder through link to dotfiles/bin