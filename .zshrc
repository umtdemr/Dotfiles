# Path to your oh-my-zsh installation.
export ZSH="/Users/mediumgoal/.oh-my-zsh"

ZSH_THEME="gianu"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh


export PATH="$HOME/.poetry/bin:$PATH"

# alias brew='arch -x86_64 brew'
# export NVM_DIR="$HOME/.nvm"
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
alias vim="nvim"
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#859900"
