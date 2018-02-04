#!/bin/bash
set -e

assert_repo () {
  url=$1
  path=$2
  commitish=${3:-origin/master}

  if [ -d $path ] ; then
    git -C $path fetch $url
  else 
    git clone $url $path
  fi

  git -C $path reset --hard $commitish
}

cp vimrc ~/.vimrc

mkdir -p ~/.fonts
cp fonts/* ~/.fonts/

# Set up VIM plugins
VIMPLUGINDIR=$HOME/.vim/pack/plugins/start
mkdir -p $VIMPLUGINDIR
assert_repo https://github.com/altercation/vim-colors-solarized.git $VIMPLUGINDIR/vim-colours-solarized
assert_repo https://github.com/vim-airline/vim-airline.git $VIMPLUGINDIR/vim-airline
assert_repo https://github.com/fatih/vim-go.git $VIMPLUGINDIR/vim-go
assert_repo https://github.com/pangloss/vim-javascript.git $VIMPLUGINDIR/vim-javascript
assert_repo https://github.com/tpope/vim-fugitive.git $VIMPLUGINDIR/vim-fugitive
assert_repo https://github.com/python-mode/python-mode.git $VIMPLUGINDIR/python-mode
assert_repo https://github.com/rust-lang/rust.vim $VIMPLUGINDIR/rust.vim

fc-cache -vf ~/.fonts
