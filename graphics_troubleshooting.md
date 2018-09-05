## Some Graphics Troubleshooting Steps

### show all relevant system config info from `inxi`
```
inxi -SMGxxxz
```

### Arch Wiki
Some very important articles on the Arch wiki for troubleshooting
- [Xorg](https://wiki.archlinux.org/index.php/Xorg)
- [TLP](https://wiki.archlinux.org/index.php/TLP)
- [NVIDIA](https://wiki.archlinux.org/index.php/NVIDIA)
- [NVIDIA Optimus](https://wiki.archlinux.org/index.php/NVIDIA_Optimus)
- [Intel Graphics](https://wiki.archlinux.org/index.php/Intel_graphics)
- [Kernel Modules](https://wiki.archlinux.org/index.php/Kernel_module)
- [GRUB](https://wiki.archlinux.org/index.php/GRUB)

### X.org info
```
cat /etc/X11/xorg.conf.d/*.conf
cat ~/.local/share/xorg/Xorg.?.log | grep "(EE)"
journalctl -p 3
```
