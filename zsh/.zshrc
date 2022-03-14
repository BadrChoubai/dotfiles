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
        # NVM
        export NVM_DIR="$HOME/.nvm"
        [ -s "/usr/local/opt/nvm/nvm.sh" ] && \. "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
        [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
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

