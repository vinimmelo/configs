#!/bin/bash

# update submodules
git submodule update --init --recursive

cp .vimrc ~/.vimrc

echo
echo "vimrc installed into $HOME/.vimrc"
echo

mkdir -p ~/.vim/
rsync -vr .vim/ ~/.vim
rsync -vr colors/ ~/.vim/colors
rsync -vr .tmux.conf ~/.tmux.conf

echo
echo echo "Vim plugins installed into $HOME/.vim/"
echo

if [[ `uname` == 'Darwin' ]]; then
  # MacOS
  font_dir="$HOME/Library/Fonts"
else
  # Linux
  font_dir="$HOME/.fonts"
  mkdir -p $font_dir
fi

rsync -vr fonts/ "$font_dir"

# Reset font cache on Linux
if [[ -n `which fc-cache` ]]; then
  fc-cache -f $font_dir
fi

echo
echo "Fonts installed into $font_dir"

if [[ `uname` == 'Darwin' ]]; then
  # MacOS
  echo 'Nothing more to do!'
  return
fi

if [ ! -d ~/.config ]; then
  mkdir ~/.config
  echo
  echo "Created $HOME/.config"
fi

cp flake8 ~/.config/flake8
echo
echo "Copied flake8 configuration to your $HOME/.config"

echo 'Instalattion finished!'
