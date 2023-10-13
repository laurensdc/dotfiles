# If you come from bash you might have to change your $PATH.

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="agnoster"

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
	# zsh-aws-vault
  asdf
)

source $ZSH/oh-my-zsh.sh

# [[ -s $HOME/.autojump/etc/profile.d/autojump.sh ]] && 
source $HOME/.autojump/etc/profile.d/autojump.sh

prompt_context() {
  if [[ "$Users" != "$DEFAULT_USER" || -n "$SSH_CLIENT" ]]; then
    prompt_segment black default "%(!.%{%F{yellow}%}.)$Users"
  fi
}

# User configuration
export EDITOR='nvim'

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# vi mode in terminal
set -o vi

# Android studio path variables for MacOS and Linux
if [[ "$(uname)" == "Darwin" ]]; then
    export ANDROID_HOME="$HOME/Library/Android/sdk"
else
    export ANDROID_HOME="$HOME/Android/Sdk"
fi
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

# Home folders and local folders
export PATH=~/.local/bin:$PATH
export PATH=~/bin:$PATH

# Doom emacs
export PATH=~/.config/emacs/bin:$PATH

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# Users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

# UP VPN with openconnect
# For running the cmd in the background, add -b flag
alias vpn='echo "Enter MFA token for Pulse VPN: "; read TOKEN; sudo killall -SIGINT openconnect; cat ~/.config/pulserc | sed "s/TOKEN/$TOKEN/g" | sudo openconnect vpn.unifiedpost.com --protocol=nc' 

# Prints `git checkout -b [BRANCH_NAME]`
alias branch="git status | grep 'On branch' |  sed 's/On branch \(.*\)/git checkout \1/'"

# Copy to clipboard for MacOS and x11 Linux 
if [[ "$(uname)" == "Darwin" ]]; then
  alias cpbranch="branch | pbcopy && branch"
else
  alias cpbranch="branch | xclip -selection clipboard && branch"
fi

# Checkout to master, pull it, and rebase the active branch on top of it
alias REBASE='BRANCH=$(git status | grep "On branch" | sed "s/On branch \(.*\)/\1/") && echo On branch $BRANCH && git checkout master && git pull origin master && git checkout $BRANCH && echo Rebasing $BRANCH on master && git rebase master'

# List git commits
alias log="git log --oneline -12"

# BUILD alias based on the directory
build() {
  current_folder=$(pwd)

  if [[ "$current_folder" == *"banqup"* ]]; then
    yarn
    bundle install
    npx pod-install
    yarn run prepare:all
    yarn storybook:build
  elif [[ "$current_folder" == *"design-studio"* ]]; then
    source scripts/codeartifact/export-token.sh
    yarn
    aws-vault exec codeartifact -- nx run-many --target=bundle --all --parallel=16 
  else
    echo "No build alias defined for directory $current_folder"
  fi
}

alias BUILD="build"

# nvim aliases
alias v=nvim

# MacOS preview from terminal
alias preview="qlmanage -p"

