
status --is-interactive
set -x PATH $HOME/.rbenv/bin $PATH
source (rbenv init - | psub)
set fish_greeting
set -gx EDITOR nvim
set -gx VISUAL nvim

alias gcob 'git checkout ( git branch | fzf )'
alias gs 'git status'
alias glog 'git log --pretty=format:"%h %s" --graph'
alias gc 'git commit -v'
alias gca 'git commit -v -A'
alias ga 'git add -A'
alias dot 'cd ~/dotfiles'
alias gaf 'git add (git diff --name-only | fzf)'
alias gcos 'git reset -- (git diff --name-only --cached | fzf)'
alias gcof 'git checkout -- (git diff --name-only | fzf)'
alias c 'clear'
alias gp 'git push'
alias gcam 'git commit -am'
alias gd 'git diff'
alias clipboard 'xclip -sel clip'
alias vim nvim
alias vi vim





