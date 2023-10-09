#!/bin/bash
# Install bootloader for VMs - Ubuntu/focal64 (20.10) 
# Assumes not run as root from VagrantFile
# Problem: Does not symlink the .zshrc files in user or root, no idea why do needs to be done manually!

user="$(whoami)"
vagrant=/home/"$user"
log="$vagrant"/install.log
dots="$vagrant"/github/.dotfiles

# update and install packages
sudo apt-get update && sudo apt-get upgrade -y && sudo apt-get install -m fuse libfuse-dev valgrind cmake lxc lxc-templates docker.io cmake-curses-gui vim meson python3 python3-pip git pkg-config gdb zsh net-tools tmux wget -y

if [[ ! -d "$vagrant/github" && ! -d "$dots" ]]; then
    mkdir -p $vagrant/github
    git clone https://github.com/georgesims21/.dotfiles.git "$dots"
fi

# zsh
echo "Integrating dotfiles.."
# -L check if file exists AND is a symbolic link
if [[ ! -L "$HOME/.zshrc" ]]; then
    echo "Integrating zsh & oh-my-zsh for $user.."
    sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" >> "$log" 2>&1  
    echo "Updating $user's shell to $(which zsh)"
    sudo chsh -s $(which zsh) $user
    echo "Integrating zsh & oh-my-zsh for root.."
    sudo sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" >> "$log" 2>&1  
    echo "Updating root's shell to $(which zsh)"
    sudo chsh -s $(which zsh)
    sudo rm /root/.zshrc >> "$log" 2>&1  sudo ln -s "$dots"/zsh/.zshrc /root/.zshrc
    sudo source /root/.zshrc > "$log" 2>&1 
    rm $HOME/.zshrc >> "$log" 2>&1  ln -s "$dots"/zsh/.zshrc $HOME/.zshrc
    source $HOME/.zshrc > "$log" 2>&1 
fi

# gdb
if [[ ! -L "$HOME/.gdbinit" ]]; then
    echo "Integrating gdb and pygments.."
    rm $HOME/.gdbinit >> "$log" 2>&1 ; ln -s "$dots"/gdb/.gdbinit $HOME/.gdbinit
    source $HOME/.gdbinit >> "$log" 2>&1
    pip3 install pygments >> "$log" 2>&1
fi

# tmux
if [[ ! -L "$HOME/.tmux.conf" ]]; then
    echo "Integrating tmux.."
    rm $HOME/.tmux.conf >> "$log" 2>&1; ln -s "$dots"/tmux/.tmux.conf $HOME/.tmux.conf
    source $HOME/.tmux.conf >> "$log" 2>&1
fi

# vim
if [[ ! -L "$HOME/.vimrc" ]]; then
    echo "Integrating vim and installing Vundle for $user.."
    rm $HOME/.vimrc >> "$log" 2>&1; ln -s "$dots"/vim/.vimrc $HOME/.vimrc
    source $HOME/.vimrc >> "$log" 2>&1
    git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim >> "$log" 2>&1
    vim +PluginInstall +qall >> "$log" 2>&1
    echo "Integrating vim and installing Vundle for root.."
    sudo rm root/.vimrc >> "$log" 2>&1; sudo ln -s "$dots"/vim/.vimrc /root/.vimrc
    sudo source root/.vimrc >> "$log" 2>&1
    sudo git clone https://github.com/VundleVim/Vundle.vim.git root/.vim/bundle/Vundle.vim >> "$log" 2>&1
    sudo vim +PluginInstall +qall >> "$log" 2>&1
fi

# reboot for all to take effect
echo "Rebooting system for changes to take effect.."
sudo reboot
