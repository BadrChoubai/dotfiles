# OS Dependent Loads

case "$OSTYPE" in
	darwin*)
		source $(brew --prefix)/share/antigen/antigen.zsh
		# NVM
		export NVM_DIR="$HOME/.nvm"
		[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
		[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
		# Add homebrew to PATH
		export PATH="/usr/local/sbin:$PATH"
        # Add Python to PATH
        export PATH=$PATH:/Users/badrchoubai/Library/Python/3.7/bin/
        export PATH="/usr/local/opt/llvm/bin:$PATH"
        export PATH="$PATH:/path/to/elixir/bin"
        export PATH="/usr/local/opt/openjdk/bin:$PATH"
        export CPPFLAGS="-I/usr/local/opt/openjdk/include"

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


# aliases
alias python=python3 
alias pip=pip3
alias vim=nvim
alias zshrs="exec zsh"

# Folder Aliases 
alias pj="cd ~/projects/"
alias tut="cd ~/tutorials/"
alias df="cd ~/dotfiles/"

# >>>> Vagrant command completion (start)
fpath=(/opt/vagrant/embedded/gems/2.2.16/gems/vagrant-2.2.16/contrib/zsh $fpath)
compinit
# <<<<  Vagrant command completion (end)

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
