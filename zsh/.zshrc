# OS Dependent Loads

case "$OSTYPE" in
	darwin*)
		source $(brew --prefix)/share/antigen/antigen.zsh
		antigen use oh-my-zsh

		antigen bundle git
		antigen theme robbyrussell

		# Done with Antigen
		antigen apply

		# Add homebrew to PATH
		export PATH="/usr/local/sbin:$PATH"
		# Add Python to PATH
		export PATH=$PATH:/Users/badrchoubai/Library/Python/3.7/bin/
		export PATH=$PATH:/Users/badrchoubai/Library/Python/3.8/bin/
		export PATH=$PATH:/Users/badrchoubai/Library/Python/3.9/bin/
		export PATH="/usr/local/opt/llvm/bin:$PATH"
		;;	
	linux-gnu)
		# Set up the prompt

		autoload -Uz promptinit
		promptinit
		prompt adam1

		setopt histignorealldups sharehistory

		# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
		HISTSIZE=1000
		SAVEHIST=1000
		HISTFILE=~/.zsh_history

		# Use modern completion system
		autoload -Uz compinit
		compinit

		zstyle ':completion:*' auto-description 'specify: %d'
		zstyle ':completion:*' completer _expand _complete _correct _approximate
		zstyle ':completion:*' format 'Completing %d'
		zstyle ':completion:*' group-name ''
		zstyle ':completion:*' menu select=2
		eval "$(dircolors -b)"
		zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
		zstyle ':completion:*' list-colors ''
		zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
		zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
		zstyle ':completion:*' menu select=long
		zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
		zstyle ':completion:*' use-compctl false
		zstyle ':completion:*' verbose true

		zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
		zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
		;;
esac

source ~/.zsh_profile

