My dotfiles, have a look, try them, give me hints for improvement...

Install
=======
    cd ~ && git clone git://github.com/grosser/dotfiles.git

Manual Install
--------------
Symlink the files you want to use e.g.
    ln -s dotfiles/rspec .rspec

Automatic install
-----------------
    ruby dotfiles/install.rb

For OSx: `ln -s .bashrc .bash_login`

install.rb will:

 - *make a backup of all the files it changes* to ~/dotfiles_backup_TIMESTAMP
 - replaces .file through links to dotfiles/file for .bashrc .gitignore .irbrc .rspec
 - replace content of .gitconfig, except for [github] and [user] section

Secret
------
If you add a folder named 'secret' to dotfiles it will also symlink stuff from there.
e.g. `ln -s /home/micha/Dropbox/Private/dotfiles dotfiles/secret`

### [Contributors](http://github.com/grosser/dotfiles/contributors)
 - [Roman Heinrich](http://github.com/mindreframer)

[Michael Grosser](http://grosser.it)
michael@grosser.it
Hereby placed under public domain, do what you want, just do not hold me accountable...
