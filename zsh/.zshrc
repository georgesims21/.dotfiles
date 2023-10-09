set -o vi
export PATH=$HOME/bin:/usr/local/bin:$PATH:$HOME/.dotfiles/scripts:$HOME/.emacs.d/bin:$HOME/.local/bin

export ZSH="$HOME/.oh-my-zsh"
export XDG_SCREENSHOTS_DIR="$HOME/Pictures/screenshots"
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export ANKI_WAYLAND=1
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="${PATH}:${GOBIN}"

bindkey -v
export KEYTIMEOUT=1

#wmname LG3D <- this was a clion fix in wayland (sway wm)

ZSH_THEME="risto"
SPACESHIP_VI_MODE_SHOW=false
DISABLE_UPDATE_PROMPT="true"
COMPLETION_WAITING_DOTS="true"
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

alias p="sudo pacman"
alias pi="sudo pacman -S"
alias pu="sudo pacman -Syu"
alias pr="sudo pacman -Rsn"
alias dots="cd $HOME/.dotfiles"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias vi3="vim $HOME/.config/i3/config"
alias vzrc="vim $HOME/.zshrc"
alias vrc="vim $HOME/.vimrc"
alias hibernate="systemctl hibernate"
alias vf='vim $(fzf)'
alias tmux='tmux -f /home/george/.config/tmux/.tmux.conf'
alias k='kubectl'
alias kgp='kubectl get pods'
alias acheck='ansible-playbook playbook.yaml --check --diff'
alias sort-mirrors="""
	export TMPFILE="$(mktemp)"; \
	sudo true; \
	rate-mirrors --save=$TMPFILE arch --max-delay=43200 \
		&& sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
		&& sudo mv $TMPFILE /etc/pacman.d/mirrorlist
"""
cdmkdir() {
	mkdir $1 && cd $1
}
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

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/home/george/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
