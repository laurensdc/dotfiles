# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set up history tracking like omz
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory
setopt sharehistory
setopt histignorealldups
setopt interactivecomments

# Fast completion initialization
autoload -Uz compinit
compinit -C

# Load brew (macOS / WSL)
[ -f /opt/homebrew/bin/brew ] && eval "$(/opt/homebrew/bin/brew shellenv)"
[ -f /home/linuxbrew/.linuxbrew/bin/brew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Load autojump
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
[ -f $HOME/.autojump/etc/profile.d/autojump.sh ] && . $HOME/.autojump/etc/profile.d/autojump.sh

# Load fzf key bindings and fuzzy completion
source <(fzf --zsh)

# Load Deno
[ -f $HOME/.deno.env ] &&  . $HOME/.deno/env

# fnm
FNM_PATH="/home/laurens/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --shell zsh --version-file-strategy=recursive)"
fi

# p10k
source ~/dotfiles/powerlevel10k/powerlevel10k.zsh-theme

# Load p10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# --- ENVIRONMENT VARIABLES ---
# One editor to rule them all
export EDITOR="nvim"
export VISUAL="nvim"

# Load Zsh line editing function
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line
bindkey '^xe' edit-command-line

# Bash-like word boundaries
autoload -Uz select-word-style
select-word-style bash

# Enable case-insensitive, smart-case, and partial-word completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# ctrl+p and ctrl+n for prev/next commands
bindkey '^P' up-line-or-history
bindkey '^N' down-line-or-history

# Language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Home folders and local folders
export PATH=~/.local/bin:$PATH
export PATH=~/bin:$PATH

# Add go to path
export PATH=$PATH:$HOME/go/bin

# Suppress login message
touch ~/.hushlogin

# Don't close terminal on ctrl+D
set -o ignoreeof

# Prints `git checkout -b [BRANCH_NAME]`
alias branch="git status | grep 'On branch' |  sed 's/On branch \(.*\)/git checkout \1/'"

# Copy to clipboard for MacOS and x11 Linux 
if [[ "$(uname)" == "Darwin" ]]; then
  alias cpbranch="branch | pbcopy && branch"
else
  alias cpbranch="branch | xclip -selection clipboard && branch"
fi

# `gcof CRP-123` will find and checkout the local branch containing this string
alias gcof='f() { git checkout $(git branch -a | grep -i "$1" | head -1); }; f'

# Checkout to master, pull it, and rebase the active branch on top of it
alias REBASE='BRANCH=$(git status | grep "On branch" | sed "s/On branch \(.*\)/\1/") && echo On branch $BRANCH && git checkout main && git pull origin main && git checkout $BRANCH && echo Rebasing $BRANCH on main && git rebase main'

# List git commits
alias log="git log --oneline -12"

# Print a jj log without interactive mode
alias jjl="jj log -n 10 --no-pager"

# Open Neogit
alias g="nvim -c \"Neogit\""

# nvim alias
alias v=nvim

# neovide alias, fork process and don't block terminal
alias nv="neovide --fork"

# MacOS preview from terminal
alias preview="qlmanage -p"

# Gitmoji alias
alias gm="gitmoji -c"

alias ..="cd .."
alias ...="cd ../.."
alias l="ls -lah --color=auto"

# Windows 
alias editahk="nvim /mnt/c/Users/CoredusK/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/Keys_*.ahk"
alias cdwincode="cd /mnt/c/Code"

