# arch-monitor-config
Bash Script for automatically creating a Monitor config file in X on Arch Linux.

It will put screens randomly to the right of your primary display. 

You need `xorg`, `xinit`, `grep` and `awk`.


*If you want it to do it automatically on load:*

Insert `/path/to/script` in your .bashrc/.zshrc before running anythin X related.

And add `username ALL=(root) NOPASSWD: /path/to/script` in `visudo` towards the bottom of your priviliges. If you haven't touched it, put it under `root ALL=(ALL) ALL`
