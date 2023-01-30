{ 
pkgs
, config
, ...
}: {
  home.packages = with pkgs; [
    alsa-lib
    alsa-plugins
    alsa-tools
    alsa-utils

    bandwhich
    brave
    cached-nix-shell
    cinnamon.nemo
    coreutils
    dconf
    fd
    ffmpeg-full
    gcc
    glib
    glxinfo
    gnome.gucharmap
    helix
    imagemagick
    jq
    license-generator
    lm_sensors
    lutris
    mpv
    neo
    pamixer
    pavucontrol
    playerctl
    protonup
    pulseaudio
    psmisc
    ripgrep
    rsync
    session-desktop
    spotifywm
    tree
    ttyper
    unzip
    viu
    xdg-utils
    xfce.thunar
  ];
}
