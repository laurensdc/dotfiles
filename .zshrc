# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
)

# Load oh-my-zsh
source $ZSH/oh-my-zsh.sh

# Load brew on WSL
[ -f /home/linuxbrew/.linuxbrew/bin/brew ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# Load autojump
[ -f $HOME/.autojump/etc/profile.d/autojump.sh ] && . $HOME/.autojump/etc/profile.d/autojump.sh
[ -f /opt/homebrew/etc/profile.d/autojump.sh ] && . /opt/homebrew/etc/profile.d/autojump.sh
 
# Load p10k - To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Load fzf key bindings and fuzzy completion
source <(fzf --zsh)
 
# Load nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"  # This loads nvm
[ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix nvm)/etc/bash_completion.d/nvm"  


# Load Deno 
[ -f $HOME/.deno.env ] &&  . $HOME/.deno/env

# No idea what this does anymore
prompt_context() {
  if [[ "$Users" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$Users"
  fi
}

# One editor to rule them all
export EDITOR='nvim'


# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# vi mode in terminal, disabling for now as then it behaves weird
# when using terminal within nvim
# set -o vi

# Home folders and local folders
export PATH=~/.local/bin:$PATH
export PATH=~/bin:$PATH

# Add go to path
export PATH=$PATH:$(go env GOPATH)/bin

# Suppress login message
touch ~/.hushlogin

# Prints `git checkout -b [BRANCH_NAME]`
alias branch="git status | grep 'On branch' |  sed 's/On branch \(.*\)/git checkout \1/'"

alias tf=terraform

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

# nvim alias
alias v=nvim

# neovide alias, fork process and don't block terminal
alias nv="neovide --fork"

# MacOS preview from terminal
alias preview="qlmanage -p"

# Gitmoji alias
alias gm="gitmoji -c"

# Don't close terminal on ctrl+D
set -o ignoreeof

# WSL stuff to make life less miserable on Windows
# Add nvim to path on WSL
export PATH="$PATH:/opt/nvim-linux64/bin"

# VM nvim path
export PATH="$PATH:~/nvim"

# Edit ahk script on windows
alias editahk="nvim /mnt/c/Users/CoredusK/AppData/Roaming/Microsoft/Windows/Start\ Menu/Programs/Startup/Keys_*.ahk"
# Cd to code on windows
alias cdwincode="cd /mnt/c/Code"

# yazi wrapper to press `y`, changes cwd when exiting yazi
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}
