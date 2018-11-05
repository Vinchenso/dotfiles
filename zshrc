# Path to your oh-my-zsh installation.
export PATH=$HOME/bin:/usr/local/bin:$PATH
#
export ZSH="/home/chenso/.oh-my-zsh"
#
#export TERM=screen-256color
export VISUAL=vim
export EDITOR="$VISUAL"
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME=""
killport() { lsof -ti:$1 | xargs kill }
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.

plugins=(git)
plugins=(zsh-autosuggestions)
plugins=(zsh-syntax-highlighting)

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"


#alias tmux="tmux -2"


github-create(){
echo "Git init ..."
git init
echo "Git init done"

repo_name=$1

dir_name=`basename $(pwd)`
invalid_credentials=0

if [ "$repo_name" = "" ]; then
  echo "  Repo name (hit enter to use '$dir_name')?"
  read repo_name
fi

if [ "$repo_name" = "" ]; then
  repo_name=$dir_name
fi

username=`git config github.user`

if [ "$username" = "" ]; then
  echo "  Could not find username, run 'git config --global github.user <username>'"
  invalid_credentials=1
fi

curl -u "$username" https://api.github.com/user/repos -d '{"name":"'$repo_name'"}'
echo "Repo added ..."

echo "Git added and commited ..."
git add . && git commit -m "first commit"
echo "Git staged done"

echo "Adding remote server ..."
git remote add origin https://github.com/$username/$repo_name.git
echo "Remote server added ..."
}
export FZF_DEFAULT_COMMAND='ag -g ""'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# load aliases
[[ -f ~/.aliases ]] && source ~/.aliases

alias tmux="env TERM=xterm-256color tmux"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
fpath=($fpath "/home/chenso/.zfunctions")

# Set Spaceship ZSH as a prompt
autoload -U promptinit; promptinit
prompt spaceship

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export PATH="$HOME/.rbenv/plugins/ruby-build/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh



export NODE_PATH="/home/chenso/.nvm/versions/node/v10.12.0/lib/node_modules"
