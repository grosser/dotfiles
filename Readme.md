My dotfiles, have a look, try them, give me hints for improvement...

# Install

`install.rb` will:
- *make a backup of all the files it changes* to ~/dotfiles_backup_TIMESTAMP
- replaces .file through links to dotfiles/file for all files named `dot*` in `~/dotfiles` and `~/dotfiles/secret`
- replace content of `.gitconfig`, except for `[github]` and `[user]` section

## Semi automatic install

```
cd ~ && git clone git://github.com/grosser/dotfiles.git
```

If you add a folder named `secret` to dotfiles before running setup, it will also symlink from there.
e.g. `ln -s /home/<your user>/Dropbox/Private/secret secret`

```
cd ~
ruby dotfiles/install.rb
```

## Manual Install
Clone and then symlink the files you want to use e.g.

```Bash
cd ~ && ln -s dotfiles/rspec .rspec
```

## Automatic install (no support for `secret` folder)

```Bash
curl -L https://raw.github.com/grosser/dotfiles/master/autoload.sh | bash -s master
```

### [Contributors](http://github.com/grosser/dotfiles/contributors)
 - [Roman Heinrich](http://github.com/mindreframer)

[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
License: MIT
