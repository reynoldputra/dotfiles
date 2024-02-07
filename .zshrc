export ZSH="$HOME/.oh-my-zsh"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=vim

ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
SHELL="/bin/zsh"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  z
  kubectl
  terraform
)

source $ZSH/oh-my-zsh.sh

# ==================
# User configuration
# User configuration
# User configuration
# ==================

### cargo
# . "$HOME/.cargo/env"

### asfd
# "$HOME/.asdf/asdf.sh"


### nvm
# export NVM_DIR="$HOME/.nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"


### npm 
export NPM_CONFIG_PREFIX=~/.npm-global
export PATH=$PATH:~/.npm-global/bin

### golang
export PATH=$PATH:/usr/local/go/bin

### aws
complete -C /usr/local/bin/aws_completer aws

### terraform
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform


eval "$(starship init zsh)"
