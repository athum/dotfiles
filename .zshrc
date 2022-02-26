export PATH=$HOME/bin:/usr/local/bin:$PATH

# path to your oh-my-zsh installation.
export ZSH="/Users/${USER}/.oh-my-zsh"

# zsh theme: https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="sorin"

# use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# automatically update without prompting
DISABLE_UPDATE_PROMPT="true"

# how often to auto-update (in days)
export UPDATE_ZSH_DAYS=14

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

plugins=(
	colored-man-pages
	git
	history
	zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# alice's universal personal configuration
# specific system/project aliases and environment variables in stored
# in the ZSH_CUSTOM folder

# use vim to edit shell commands
set -o vi

export EDITOR="nvim"
export NVIMCFG='$HOME/.config/nvim/init.vim'

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

alias shlcfg='$EDITOR $HOME/.zshrc'
alias vimcfg='$EDITOR $HOME/.vimrc'
alias nvimcfg='$EDITOR $HOME/.config/nvim/init.vim'
alias hypcfg='$EDITOR $HOME/.hyper.js'

alias shlsrc='source $HOME/.zshrc'
alias vimsrc='source $HOME/.vimrc'
alias nvimsrc='source $HOME/.config/nvim/init.vim'

# GOPATH
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
