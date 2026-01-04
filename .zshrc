export PATH=$HOME/bin:/usr/local/bin:/Users/alice.thum/.local/bin:$PATH:/Users/alice.thum/.bin

# general settings and appearance
export ZSH="/Users/${USER}/.oh-my-zsh" # path to oh-my-zsh installation
ZSH_THEME="sorin" # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

DISABLE_AUTO_TITLE="true" # disables auto-setting terminal title
ENABLE_CORRECTION="true" # enables command auto-correction
COMPLETION_WAITING_DOTS="true" # displays red dots when waiting for completion
HIST_STAMPS="yyyy-mm-dd"

# updates
DISABLE_UPDATE_PROMPT="true" # automatically update without prompting
export UPDATE_ZSH_DAYS=7 # how often to auto-update (in days)

# Disable marking untracked files under VCS as dirty. 
# This makes repository status check for large repositories much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

plugins=(
	colored-man-pages
	git
	history
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# use vim to edit shell commands
set -o vi

alias ex='exit'

export EDITOR="nvim"
export NVIMCFG='$HOME/.config/nvim/init.vim'


alias zshcfg='$EDITOR $HOME/.zshrc'
alias nvimcfg='$EDITOR $HOME/.config/nvim/init.vim'

alias zshsrc='source $HOME/.zshrc'
alias nvimsrc='source $HOME/.config/nvim/init.vim'

# GOPATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

fpath[1,0]=$HOME/.zsh/completion

# The following lines were added by compinstall
zstyle :compinstall filename '/Users/alice.thum/.zshrc'
autoload -Uz compinit
compinit 
# End of lines added by compinstall

zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.zsh/cache
# . /Users/alice.thum/.asdf/asdf.sh
# . /Users/alice.thum/.asdf/plugins/java/set-java-home.zsh

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/alice.thum/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions
