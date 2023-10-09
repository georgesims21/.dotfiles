# .dotfiles
Collection of personal configfiles (dotfiles) for various programs

[guide](https://www.dannyguo.com/blog/remap-caps-lock-to-escape-and-control/)
For the caps->esc & ctrl on hold:
use the interception delay.git one, and don't forget to do: sudo systemctl start udevmon.service as well!
If this turns into an error (i.e the caps still works), check the systemctl log for the udevmon service with
```bash
systemctl status udevmon.service
```
If the service is "dead", try reinstalling and restarting the service. If the service failed check the logs with:
```bash
journalctl -u udevmon
```
Most recently the error was the configuration file, it was searched for (by udevmon) in a different directory, so I copied it there and restarted the service and it worked.   

To enable dunst notifications: https://www.addictivetips.com/ubuntu-linux-tips/set-up-better-system-notifications-on-linux-with-dunst/
```bash
    systemctl enable --user dunst.service
    systemctl start --user dunst.service
```

For running xrandr on lid open/close, acpid must be used. This controls all actions regarding lid/power/fn keys etc and allows you to run scripts when one event happens. Firstly this needs to be enabled:
```bash
sudo acpid start
sudo systemctl enable acpid.service
sudo systemctl start --now acpid.service
```
Then within the ```/etc/acpi/``` directory you will find a file ```handler.sh``` which is the main handle for all events. It allows you to run a user defined script within ```/etc/acpi/events/``` which as an example may look like this:
```bash
# /etc/acpi/events/lid-close
event=button/lid # Can find this out using acpi_listen and performing the action you wish to find the command for
action=/etc/acpi/scripts/switch_display.sh # Some need "%e" adding to end
```
Where ```switch_display.sh``` is a user-defined script changing display settings.
For info and logs use
```bash
systemctl status acpid.service
journalctl -u acpid -f
```
