# OS Dependent Loads

case "$OSTYPE" in
	darwin*)
		source $(brew --prefix)/share/antigen/antigen.zsh
		# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
		export PATH="$PATH:$HOME/.rvm/bin"
		# NVM
		export NVM_DIR="$HOME/.nvm"
		[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
		[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
		# Add homebrew to PATH
		export PATH="/usr/local/sbin:$PATH"
		;;	
esac

antigen use oh-my-zsh

antigen bundle git
antigen theme robbyrussell

# Done with Antigen
antigen apply

export PROMPT="${USER} %~ :: "
export DO_NOT_TRACK=1

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Read markdown in terminal
rmd() {
	pandoc $1 | lynx -stdin
}

# Initialize Python Project
pyinit() {
    echo Setting up $1
    mkdir $1
    cd $1
    touch __main__.py
    echo "print('Hello, World!')" >> __main__.py
    mkdir $1
    cd $1
    touch __init__.py
    cd ..
    
}

# Add Python to PATH
export PATH=$PATH:/Users/badrchoubai/Library/Python/3.7/bin/

# aliases
alias python=python3 
alias pip=pip3
alias vim=nvim
alias zshrs="exec zsh"

# Folder Aliases 
alias pj="cd ~/projects/"
alias tut="cd ~/tutorials/"
alias df="cd ~/dotfiles/"
