{
  imports = [
    ./openssh.nix
    ./pipewire.nix
    ./plymouth.nix
  ];
  services.gnome.gnome-keyring.enable = true;
}
