# dotfiles




### Yubikey
After a fresh install, do the following to allow for yk login
* `nix-shell -p pam_u2f`
* `mkdir -p $XDG_CONFIG_HOME/Yubico`
* `pamu2fcfg > $XDG_CONFIG_HOME/Yubico/u2f_keys`


See [NixOS wiki Yubikey entry](https://nixos.wiki/wiki/Yubikey)