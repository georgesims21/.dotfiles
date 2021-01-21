# .dotfiles
Collection of personal configfiles (dotfiles) for various programs

[guide](https://www.dannyguo.com/blog/remap-caps-lock-to-escape-and-control/)
For the caps->esc & ctrl on hold:
use the interception delay.git one, and don't forget to do: sudo systemctl start udevmon.service as well!
If this turns into an error (i.e the caps still works), check the systemctl log for the udevmon service with
```
systemctl status udevmon.service
```
If the service is "dead", try reinstalling and restarting the service. If the service failed check the logs with:
```
journalctl -u udevmon
```
Most recently the error was the configuration file, it was searched for (by udevmon) in a different directory, so I copied it there and restarted the service and it worked.
To enable dunst notifications: https://www.addictivetips.com/ubuntu-linux-tips/set-up-better-system-notifications-on-linux-with-dunst/
```
    systemctl enable --user dunst.service
    systemctl start --user dunst.service
```

