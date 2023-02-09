# dotfiles

* 🖥 X11 / i3wm / lightdm
* 🪟 polybar / rofi / dunst
* 🐚 kitty / fish / starship
* ⚡ libvirtd / docker / podman
* 🏠 homemanager

## 📦 Contents

- [system modules](modules/nixos) ❄ modularized NixOS system configuration.
    - [bootloader](modules/nixos/bootloader) 🐛 provides a generic grub configuration
    - [hardware](modules/nixos/hardware) 🟩 nvidia desktop hardware config.  green go oss soon or it will be the last.
    - [steam](modules/nixos/steam) 🎮 provides steam with runtime configuration and helpful tools
    - [virtualization](modules/nixos/virtualization) ⚡ Enables docker, libvirtd, and podman
    - [windowManager](modules/nixos/windowManager) ✖ Configures X & i3wm with lightdm and light 🍙
- [home manager](home/slwst) 🏠 modularized home configuration
    - [programs](home/slwst/modules/programs) 😸 kitty, discord, helix, etc
    - [shell](home/slwst/modules/programs) 🐟🚀 my trusty fish+starship config plus friends
    - [windowManager](home/slwst/modules/programs) 🍚 for i3wm/gtk and polybar
- [hosts](hosts)
    - [epsilon](hosts/epsilon) ϵ i9-12900KF (24) @ 5.100GHz / RTX 2080 SUPER / 32gb
    - [nixie](hosts/nixie) - VM for experimentation

## Fresh Install
### cli
* make bat caches for external theme support
    - `bat cache --build`

### Yubikey
After a fresh install, do the following to allow for yk login
* `nix-shell -p pam_u2f`
* `mkdir -p $XDG_CONFIG_HOME/Yubico`
* `pamu2fcfg > $XDG_CONFIG_HOME/Yubico/u2f_keys`


See [NixOS wiki Yubikey entry](https://nixos.wiki/wiki/Yubikey) and Dr. Duh's
excellent [yubikey resource](https://github.com/drduh/YubiKey-Guide)

## ❤️  Special credit and thanks to
[rxyhn](https://github.com/rxyhn)
[sioodmy](https://github.com/sioodmy)

This repository is a direct result of taking apart and putting back together
the dotfile repositories provided by @rxyhm and @sioodmy while learning nix and
nixOs.  All credit for anything resembling coherent code goes to them 💕
