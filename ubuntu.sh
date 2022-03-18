#!/usr/bin/env zsh

if [ ! -d "$DOTFILES/uses" ]; 
then 
  echo "No diretory found: $PACKAGES\nCreating directory at $PACKAGES"
  mkdir $DOTFILES/uses
  touch $DOTFILES/uses/README.md
  echo "You can start adding configuration for the tools you use in this folder.\nFor instance, you could add a `zsh` folder with your zsh configuration." 
  \ >> $DOTFILES/uses/README.md;

  source up.sh
else 
  echo "Linking packages to root directory"
  source ./scripts/install.sh $STOW_FOLDERS;
fi
