{
  imports = [
    ./feh.nix
    ./gtk.nix
    ./rofi.nix
    ./waybar.nix
    ./swaylock.nix

    ./dunst
    ./polybar
  ];
  services.easyeffects.enable = true;
}

