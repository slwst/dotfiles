{ 
pkgs
, config
, ...
}: {
  home.packages = with pkgs; [
    bandwhich
    brave
    cached-nix-shell
    coreutils
    dconf
    fd
    gcc
    helix
    imagemagick
    jq
    lm_sensors
    mpv
    pavucontrol
    ripgrep
    rsync
    session-desktop
    tree
    ttyper
    unzip
    xfce.thunar
  ];
}
