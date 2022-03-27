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
    esac
done

echo "Running $OSTYPE Setup Scripts";
sudo -vy;

case "$OSTYPE" in
    darwin*)
        # macos intallation scripts
        source darwin.sh;
    ;;
    linux-gnu)
        # linux installation scripts
        source linux.sh;
    ;;
esac

echo "Linking packages to root directory"
source ./scripts/_stow.sh "$STOW_FOLDERS"

