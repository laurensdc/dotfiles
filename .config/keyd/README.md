Install keyd
<https://github.com/rvaiya/keyd>

Then symlink the config files to the expected location

```
sudo ln -s ~/dotfiles/.config/keyd/apple-keyboard.conf /etc/keyd/apple-keyboard.conf
sudo ln -s ~/dotfiles/.config/keyd/logitech-keyboard.conf /etc/keyd/logitech-keyboard.conf
sudo systemctl restart keyd
```

On Fedora, use keyboard layout Apple | Apple Aluminium (ANSI) and map right control to composite key, caps lock disabled, caps lock as ctrl
