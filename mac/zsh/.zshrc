set -o vi
export PATH=/usr/local/opt/texinfo/bin:$HOME/bin:/usr/local/bin:$PATH:$HOME/.dotfiles/scripts:$HOME/.emacs.d/bin:$HOME/.local/bin:$HOME/.rd/bin:$HOME/Scripts:/opt/h-m-m:/opt/homebrew/bin

export ZSH="$HOME/.oh-my-zsh"
export XDG_SCREENSHOTS_DIR="$HOME/Pictures/screenshots"
export SDL_VIDEODRIVER=wayland
export _JAVA_AWT_WM_NONREPARENTING=1
export QT_QPA_PLATFORM=wayland
export XDG_CURRENT_DESKTOP=sway
export XDG_SESSION_DESKTOP=sway
export ANKI_WAYLAND=1
#export GO111MODULE=on go get golang.org/x/tools/gopls@latest
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

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
    kube-ps1
    fzf-zsh-plugin
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
alias tmux='tmux -f ~/.dotfiles/mac/tmux/.tmux.conf'
alias sort-mirrors="""
	export TMPFILE="$(mktemp)"; \
	sudo true; \
	rate-mirrors --save=$TMPFILE arch --max-delay=43200 \
		&& sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-backup \
		&& sudo mv $TMPFILE /etc/pacman.d/mirrorlist
"""
alias gfp="git push --force-with-lease"
alias gitprev="git diff-tree --no-commit-id --name-only -r"
alias awslogin="saml2aws login --skip-prompt && aws ecr get-login-password --profile shared \
    --region eu-west-1 | docker login --username AWS --password-stdin \
    893087526002.dkr.ecr.eu-west-1.amazonaws.com"
alias tl='telepresence'
alias hmm='h-m-m'

# Kubernetes
alias k="kubectl"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kgp="kubectl get pods"
alias kl="kubectl logs"
alias kc="kubectx $1"
alias kn="kubens $1"
alias kgn="kubectl get namespace"
alias kgc="kubectx"
alias ka="kubectl apply"
alias prc="gh pr create --fill | tee /dev/tty | pbcopy"
alias prcd="gh pr create --fill --draft | tee /dev/tty | pbcopy"


# Functions
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

# fzf
# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed -E 's/ *[0-9]*\*? *//' | sed -E 's/\\/\\\\/g')
} 
# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
[[ $commands[kubectl] ]] && source <(kubectl completion zsh)

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/george.sims/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
