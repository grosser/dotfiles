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

 - replaces .file through links to dotfiles/file for .bashrc .gitignore .irbrc .ssh/config
 - replace content of .gitconfig through this, except for [github] and [user] section
 - replace bin folder through link to dotfiles/bin

TODO
====
 - make ssh/config non-user specific (like gitconfig)

Author
======
[Michael Grosser](http://pragmatig.wordpress.com)  
grosser.michael@gmail.com  
Hereby placed under public domain, do what you want, just do not hold me accountable...