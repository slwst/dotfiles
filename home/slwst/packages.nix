{
  pkgs,
  config,
  ...
}: {
  home.packages = with pkgs; [
    alsa-lib
    alsa-plugins
    alsa-tools
    alsa-utils

    bandwhich
    blender
    bottles
    brave
    cached-nix-shell
    cinnamon.nemo
    coreutils
    dconf
    fd
    ffmpeg-full
    gimp
    glava
    glib
    glxinfo
    gnome.gucharmap
    gnome.gnome-power-manager
    imagemagick
    jq
    license-generator
    lm_sensors
    lutris
    mpv
    neo
    neofetch
    nitch
    nvitop
    obsidian
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
    yubikey-manager
    yubikey-manager-qt
    yubikey-personalization
    yubikey-personalization-gui
    yubico-piv-tool
    yubioath-flutter
  ];
}
