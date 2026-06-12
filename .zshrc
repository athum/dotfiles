export PATH=$HOME/bin:/usr/local/bin:/Users/alice/.local/bin:$PATH:/Users/alice/.bin

# general settings and appearance
export ZSH="/Users/${USER}/.oh-my-zsh" # path to oh-my-zsh installation
ZSH_THEME="sorin" # https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

DISABLE_AUTO_TITLE="true" # disables auto-setting terminal title
COMPLETION_WAITING_DOTS="true" # displays red dots when waiting for completion
HIST_STAMPS="yyyy-mm-dd"
DISABLE_CORRECTION="true" # disable auto-corrections suggestions

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

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alice/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/alice/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alice/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/alice/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# git-spice
alias gs=git-spice

if command -v wt >/dev/null 2>&1; then eval "$(command wt config shell init zsh)"; fi

#
source /Users/alice/code/monorepo/scripts/zsh_functions/set-chrono-env
