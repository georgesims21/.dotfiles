#
# ~/.bashrc
#
gb() {
        echo -n '(' && git branch 2>/dev/null | grep '^*' | colrm 1 2 | tr -d '\n' && echo  -n ')'
}
git_branch() {
        gb | sed 's/()//'
}

# Vi mode 
set -o vi

# Aliases
alias v="vim"
alias p="sudo pacman"
alias pi="sudo pacman -S"
alias pu="sudo pacman -Syu"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias vi3="vim ~/.config/i3/config"
alias vbrc="vim ~/.bashrc"
alias vrc="vim ~/.vimrc"
alias vin="vim ~/index.wiki"
alias uni="cd ~/googled/shared/Uni/"
alias con="cd ~/googled/shared/Uni/YEAR\ 3/Concurrency\ and\ Multithreading/"
alias req="cd ~/googled/shared/Uni/YEAR\ 3/Requirements\ Engineering/"
alias cnm="cd ~/googled/shared/programming/java/candm/Concurrency_Multithreading"
alias hibernate="systemctl hibernate"
alias keeb="xmodmap ~/.Xmodmap"
alias disp="xrandr --output eDP1 --off --output DP1 --auto"
alias dispoff="xrandr --output eDP1 --auto --output DP1 --off"
alias prog="cd ~/googled/shared/programming"
alias progr="cd ~/googled/shared/programming/python/reqeng/ReqEng"

purple=$(tput setaf 139);
green=$(tput setaf 70);
blue=$(tput setaf 109);
grey=$(tput setaf 254);
white=$(tput setaf 255);
bold=$(tput bold);
reset=$(tput sgr0);

PS1="\[${bold}\]\n";
PS1+="\[${white}\]_\[${green}\] \u "; #Username
PS1+="\[${blue}\][ \W ]"; #Working dir
#PS1+="\[${blue}\] $(git_branch)"; # Not working properly
PS1+="\[${white}\]\n└─";
PS1+="\[${white}\]$ "; #Prompt on new line
PS1+="\[${reset}\]";
export PS1;
