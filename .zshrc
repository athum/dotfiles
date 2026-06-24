export PATH=$HOME/bin:/usr/local/bin:/Users/athum/.local/bin:$PATH:/Users/athum/.bin

# general settings and appearance
export ZSH="/Users/${USER}/.oh-my-zsh" # path to oh-my-zsh installation
ZSH_THEME="sorin" # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

DISABLE_AUTO_TITLE="true" # disables auto-setting terminal title
COMPLETION_WAITING_DOTS="true" # displays red dots when waiting for completion
DISABLE_CORRECTION="true" # disable auto-corrections suggestions

HIST_STAMPS="yyyy-mm-dd"
HISTSIZE=5000 # Number of commands to keep in memory during session
SAVEHIST=5000 # Number of commands to save to history file

# updates
DISABLE_UPDATE_PROMPT="true" # automatically update without prompting
export UPDATE_ZSH_DAYS=7 # how often to auto-update (in days)

# Disable marking untracked files under VCS as dirty. 
# This makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

plugins=(
	colored-man-pages
	git
	history
	kube-ps1
)

source $ZSH/oh-my-zsh.sh

# adds kubectx to zsh prompt
# adjust prompt after sourcing oh-my-zsh.sh
PROMPT='$(kube_ps1) '$PROMPT

# use vim to edit shell commands
set -o vi

# neovim
export EDITOR="nvim"
export NVIMCFG='$HOME/.config/nvim/init.vim'

# GOPATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

source <(fzf --zsh)

# git-spice
alias gs=git-spice

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi
