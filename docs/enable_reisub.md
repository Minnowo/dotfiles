
# Enable SysRq

https://wiki.archlinux.org/title/keyboard_shortcuts

## Kernel Parameters

You need to add `sysrq_always_enabled=1` to your Kernel parameters.

### Grub

Edit `/etc/default/grub` and add the above to `GRUB_CMDLINE_LINUX_DEFAULT`

Then run: 
```sh
grub-mkconfig -o /boot/grub/grub.cfg
```

## SystemD

https://wiki.archlinux.org/title/Sysctl#Configuration

### TLDR

```sh
echo "kernel.sysrq=1" | sudo tee -a /etc/sysctl.d/99-sysctl.conf
```

### Archive

---
**NOTE**

From version 207 and 21x, [systemd](https://wiki.archlinux.org/title/Systemd) only applies settings from `/etc/sysctl.d/*.conf` and `/usr/lib/sysctl.d/*.conf`.
If you had customized `/etc/sysctl.conf`, you need to rename it as `/etc/sysctl.d/99-sysctl.conf`.
If you had e.g. `/etc/sysctl.d/foo`, you need to rename it to `/etc/sysctl.d/foo.conf`.

---

The **sysctl** preload/configuration file can be created at `/etc/sysctl.d/99-sysctl.conf`.
For systemd, `/etc/sysctl.d/` and `/usr/lib/sysctl.d/` are drop-in directories for kernel sysctl parameters.
The naming and source directory decide the order of processing, which is important since the last parameter processed may override earlier ones.
For example, parameters in a `/usr/lib/sysctl.d/50-default.conf` will be overriden by equal parameters in `/etc/sysctl.d/50-default.conf` and any configuration file processed later from both directories.

To load all configuration files manually, execute:
```sh
sysctl --system 
```
which will also output the applied hierarchy. A single parameter file can also be loaded explicitly with:
```sh
sysctl --load=filename.conf
```
See the new configuration files and more specifically sysctl.d(5) for more information.

