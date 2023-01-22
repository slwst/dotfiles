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
    coreutils
    dconf
    fd
    ffmpeg-full
    gcc
    glib
    glxinfo
    helix
    imagemagick
    jq
    lm_sensors
    lutris
    mpv
    pamixer
    pavucontrol
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
    xdg-utils
    xfce.thunar
  ];
}
