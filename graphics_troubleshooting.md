## Some Graphics Troubleshooting Steps

### show all relevant system config info from `inxi`
```
inxi -SMGxxx
```

### X.org info
```
cat /etc/X11/xorg.conf.d/*.conf
cat ~/.local/share/xorg/Xorg.?.log | grep "(EE)"
journalctl -p 3
```
