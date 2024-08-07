{
  pkgs,
  config,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    alsa-lib
    alsa-plugins
    alsa-tools
    alsa-utils
    awscli2

    gsettings-desktop-schemas
    appimage-run
    bandwhich
    blender
    bluetuith
    bottles
    brave
    cached-nix-shell
    cinnamon.nemo
    coreutils
    d2
    dconf
    dig
    (discord.override {
      withOpenASAR = true;
    })
    fd
    ffmpeg-full
    #freecad
    fzf
    gh
    gimp
    glava
    glxinfo
    gnome.gucharmap
    gnome.gnome-power-manager
    gnome.nautilus
    gnome.sushi
    goverlay
    google-cloud-sdk
    kubernetes-helm
    imagemagick
    jq
    #kicad #currently broken in unstable
    libpng
    librecad
    libreoffice-fresh
    license-generator
    lm_sensors
    mame
    mangohud
    mermaid-cli
    mpv
    mumble
    neo
    neofetch
    nitch
    nvitop
    obs-studio
    openssl
    pamixer
    pavucontrol
    playerctl
    plantuml
    protonup
    pulseaudio
    psmisc
    inputs.pyfa.packages.${system}.pyfa
    razergenie
    ripgrep
    rsync
    session-desktop
    slack
    spotifywm
    strace
    #stress
    s-tui
    teamspeak_client
    tree
    ttyper
    unzip
    usbutils
    viu
    vlc
    xdg-user-dirs
    xdg-utils
    yubikey-personalization
    yubikey-personalization-gui
    yubico-piv-tool
  ];
}
