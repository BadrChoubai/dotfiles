#!/bin/zsh

sudo -v

if [[ -z $DOTFILES ]]; then
    export DOTFILES=$HOME/.dotfiles
    export USES=$DOTFILES/uses
fi

if [[ -z $STOW_FOLDERS ]]; then
	export STOW_FOLDERS=$(perl $DOTFILES/scripts/readdir.pl);
fi

while test $# -gt 0; do
    case "$1" in
        "--skip-brew"|-s)
            export SKIP_BREW=1
            shift
            ;;
        "--unstow"|-u)
            export UNSTOW=1
            echo "Unstowing all packages"
            shift
            ;;
    esac
done

echo "Running $OSTYPE Setup Scripts";

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
