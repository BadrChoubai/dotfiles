#!/usr/bin/env bash

echo "Dotfiles Directory: $DOTFILES"
echo "Uses Directory: $USES"
echo "Stow Folders: $STOW_FOLDERS"

pushd "$USES" || exit 
for package in ${STOW_FOLDERS//,/ }
do
   if [[ "$UNSTOW" ]];
    then
        stow -D --target="$HOME" --dir="$USES" "$package"
    else
        if stow -DS --target="$HOME" --dir="$USES" "$package";
        then
            echo "Package created for $package"
        else
            echo "Files or folders for $package already exist in $HOME directory."
            # https://www.gnu.org/savannah-checkouts/gnu/stow/manual/stow.html#Invoking-Stow 
            echo "Retrying stow command with --adopt flag"
            stow --target="$HOME" --dir="$USES" --adopt "$package"
            echo "Package created for $package"
        fi
    fi
done
popd || exit
