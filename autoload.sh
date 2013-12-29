#!/usr/bin/env bash
# download from github and install
set -e

# download
cd ~
git clone https://github.com/grosser/dotfiles.git

# use correct branch
cd dotfiles
git checkout ${1:-master}
cd - >/dev/null

# install
ruby dotfiles/install.rb
