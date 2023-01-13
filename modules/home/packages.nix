{ inputs
, pkgs
, config
, ...
}: {
  nixpkgs.config.allowUnfree = true;
  home.packages = with pkgs; [
    bandwhich
    brave
    cached-nix-shell
    dconf
    fd
    gcc
    imagemagick
    jq
    lm_sensors
    mpv
    pavucontrol
    ripgrep
    rsync
    session-desktop
    ttyper
    unzip
    xfce.thunar
  ];
}
