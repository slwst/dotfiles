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

    gsettings-desktop-schemas
    appimage-run
    bandwhich
    blender
    bottles
    brave
    cached-nix-shell
    cinnamon.nemo
    coreutils
    dconf
    d2
    fd
    ffmpeg-full
    fzf
    gh
    gimp
    github-desktop
    gitkraken
    glava
    glib
    glxinfo
    gnome.gucharmap
    gnome.gnome-power-manager
    goverlay
    google-cloud-sdk
    imagemagick
    jq
    libpng
    license-generator
    lm_sensors
    lutris
    mangohud
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
    razergenie
    ripgrep
    rsync
    session-desktop
    spotifywm
    strace
    stress
    s-tui
    tree
    ttyper
    unzip
    viu
    xdg-user-dirs
    xdg-utils
    yubikey-personalization
    yubikey-personalization-gui
    yubico-piv-tool
  ];
}
