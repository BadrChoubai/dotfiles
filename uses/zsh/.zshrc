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

        nvm install --lts
		;;	
    linux-gnu)
		# Set up the prompt
		PROMPT="%n-%d ~ "
		;;
esac

source ~/.zsh_profile


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
