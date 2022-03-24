#!/usr/bin/env bash

function _brew {
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew tap Homebrew/bundle
    brew bundle --file="$HOME/.dotfiles/homebrew/Brewfile"
} 

if [[ -d "$(which brew)" ]]; 
then
    echo "Homebrew is already installed at: $(which brew)"
elif [ "$SKIP_BREW" ]; 
then
    echo "Skipping homebrew install"
elif [ ! -d "$(which brew)" && ! "$SKIP_BREW" ];
then
    echo "Installing homebrew"
    _brew
fi

