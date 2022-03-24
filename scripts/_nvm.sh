#!/usr/bin/env bash

if [ ! -d $(which nvm) ]; then
    wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
fi

