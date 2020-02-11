# .dotfiles
Collection of personal configfiles (dotfiles) for various programs

* Termite
* Insync
* zsh
* ranger
* vim
* tmux
* ttf-inconsolata
* Vagrant
* virtualbox (for vagrant)
* dunst (notifications)

For the caps->esc & ctrl on hold:
use the interception delay.git one, and don't forget to do: sudo systemctl start udevmon.service as well!

To enable dunst notifications:
```
    systemctl enable --user dunst.service
    systemctl start --user dunst.service
```

