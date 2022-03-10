# OS Dependent Loads

case "$OSTYPE" in
	darwin*)
		source $(brew --prefix)/share/antigen/antigen.zsh
		# Add homebrew to PATH
		export PATH="/usr/local/sbin:$PATH"
        # Add Python to PATH
        export PATH=$PATH:/Users/badrchoubai/Library/Python/3.7/bin/
        export PATH=$PATH:/Users/badrchoubai/Library/Python/3.8/bin/
        export PATH=$PATH:/Users/badrchoubai/Library/Python/3.9/bin/
        export PATH="/usr/local/opt/llvm/bin:$PATH"
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

