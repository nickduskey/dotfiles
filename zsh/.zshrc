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
