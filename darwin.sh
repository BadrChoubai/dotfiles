#!/usr/bin/env zsh

if [[ $SKIP_BREW ]];
then
    echo "Skipping homebrew installation"
elif [[ -d "/usr/local/bin/brew" ]];
    echo "Homebrew is already installed on your machine at:\n$(which brew)"
else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew tap Homebrew/bundle
    brew bundle --file="$HOME/.dotfiles/homebrew/Brewfile"
fi

echo "Linking packages to root directory"
source ./scripts/install.sh $STOW_FOLDERS;
