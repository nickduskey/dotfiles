# Antigen -> Zsh plugin manager
export ANTIGEN_DEFAULT_REPO_URL=https://github.com/sharat87/oh-my-zsh.git
source ~/antigen.zsh

# Load oh-my-zsh
antigen use oh-my-zsh

# Bundles from the default repo
antigen bundles <<EOBUNDLES

lein
pip
command-not-found
heroku
git
zsh-users/zsh-completions src
zsh-users/zsh-history-substring-search
zsh-users/zsh-syntax-highlighting

EOBUNDLES

# Tracks your most used directories
antigen bundle rupa/z
add-zsh-hook precmd _z_precmd
function _z_precmd {
    _z --add "$PWD"
}

# Load the prompt theme
antigen theme bureau

# Vim like bindings plugin
antigen bundle sharat87/zsh-vim-mode
ZSH_VIM_MODE_NORMAL_MAP=^k

# Load the antigen
antigen apply

# Automatically list directory contents on `cd`
auto-ls () { ls --classify;  }
chpwd_functions=( auto-ls $chpwd_functions )

# Aliases
# alias ohmyzsh="mate ~/.oh-my-zsh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# autoload the correct NVM version
autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}
add-zsh-hook chpwd load-nvmrc
load-nvmrc
