set -o vi
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.dotfiles/scripts:$HOME/.emacs.d/bin:$HOME/.local/bin:
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
export PATH="$PATH:$HOME/go/bin/hello"

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export XDG_SCREENSHOTS_DIR="$HOME/Pictures/screenshots"
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export INFLUX_TOKEN=Q-UW79jVtHy279iH4AGaIJ29qABnnL3g7Irbu3XSLuwLTWlC-E_djg9goh0di0KQ0FfyQgkxIAo_eiaWdkk9Cg==
export GOPATH="$HOME/github/go"
# export FPATH="$HOME/.dotfiles/zsh/functions:$FPATH"

# Vi mode
bindkey -v
export KEYTIMEOUT=1

#wmname LG3D <- this was a clion fix in wayland (sway wm)

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="risto"
SPACESHIP_VI_MODE_SHOW=false

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS= 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

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

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    #archlinux
    cp
    github
    vagrant
    vagrant-prompt
    vi-mode
    vim-interaction
    zsh-autosuggestions
    zsh-syntax-highlighting
    )

source $ZSH/oh-my-zsh.sh

# User configuration

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

alias p="sudo pacman"
#alias pu="sudo pacman-mirrors --country Germany,France,Netherlands,United_Kingdom && sudo pacman -Syyu"
alias pi="sudo pacman -S"
alias pu="sudo pacman -Syu"
alias pr="sudo pacman -Rsn"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias vi3="vim $HOME/.config/i3/config"
alias vzrc="vim $HOME/.zshrc"
alias vrc="vim $HOME/.vimrc"
alias hibernate="systemctl hibernate"
alias vf='vim $(fzf)'
alias tmux='tmux -f /home/george/.config/tmux/.tmux.conf'
alias web="cd $HOME/bb/web"
alias ios="cd $HOME/bb/ios"
alias android="cd $HOME/bb/android"
alias sysadmin="cd $HOME/bb/sysadmin"
alias sort-mirrors="""
	export TMPFILE="$(mktemp)"; \
	sudo true; \
	rate-mirrors --save=$TMPFILE arch --max-delay=43200 \
		&& sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
		&& sudo mv $TMPFILE /etc/pacman.d/mirrorlist
"""
ssh() {
	if [ -n "$TMUX" ]; then
		tmux -2u rename-window "$(echo $* | rev | cut -d '@' -f1 | rev)";
		command ssh "$@";
		tmux -2u set-window-option automatic-rename "on" > /dev/null;
	else
	command ssh "$@";
	fi
}

ggrep() {
	git grep -o -n --color $1 | less
}

# saltstack() {
#     local saltdir="$HOME/bb/sysadmin/salt"
#     local repo="saltstack-$1-$2"
#     local path="$saltdir/$repo"
#     if [ -d $path ]; then
#         cd "/home/george/bb/sysadmin/salt/saltstack-formula-grafana"
#     else
#     #     local sshurl="ssh://git@git.m2mobi.com:7999/mms/$repo.git"
#     #     # git clone "$sshurl" "$path"
#     #     echo "hello"
#     fi
# }

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Set up Node Version Manager
source /usr/share/nvm/init-nvm.sh

# allow autocomplete for terraform
#terraform -install-autocomplete


autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/bin/terraform terraform
