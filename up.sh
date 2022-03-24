#!/usr/bin/env bash

if [[ -z $DOTFILES ]]; 
then
    export DOTFILES=$HOME/.dotfiles
    export USES=$DOTFILES/uses
fi

if [[ -z $STOW_FOLDERS ]]; then
	export STOW_FOLDERS=$(perl $DOTFILES/scripts/readdir.pl);
fi

while test $# -gt 0; do
    case "$1" in
        -s | --skip-brew)
            export SKIP_BREW=1
            echo "Skipping homebrew installation"
            shift
            ;;
        -u | --unstow)
            export UNSTOW=1
            echo "Unstowing all packages"
            shift
            ;;
        # Use this to restow a single package;
        -r=* | --restow-package=*)
            export PACKAGE="${$1#*=}"
            export RESTOW=1
            shift
            ;;
        -h | --help)
            echo "Usage function not implemented"
            exit 1
            shift
            ;;
    esac
done

echo "Running $OSTYPE Setup Scripts";
sudo -v;

case "$OSTYPE" in
    darwin*)
        # macos intallation scripts
        source darwin.sh;
    ;;
    linux-gnu)
        # linux installation scripts
        source ubuntu.sh;
    ;;
esac

echo "Installing NVM and adding it to \$PATH"
source ./scripts/_nvm.sh;
echo "Linking packages to root directory"
source ./scripts/_stow.sh $STOW_FOLDERS;

