# .dotfiles
Collection of personal configfiles (dotfiles) for various programs

[guide](https://www.dannyguo.com/blog/remap-caps-lock-to-escape-and-control/)
For the caps->esc & ctrl on hold:
use the interception delay.git one, and don't forget to do: sudo systemctl start udevmon.service as well!

To enable dunst notifications: https://www.addictivetips.com/ubuntu-linux-tips/set-up-better-system-notifications-on-linux-with-dunst/
```
    systemctl enable --user dunst.service
    systemctl start --user dunst.service
```

