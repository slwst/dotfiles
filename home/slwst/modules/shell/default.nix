{ pkgs
, lib
, config
, ...
}:
with lib; let
  browser = [ "brave.desktop" ];

  associations = {
    "text/html" = browser;
    "x-scheme-handler/http" = browser;
    "x-scheme-handler/https" = browser;
    "x-scheme-handler/ftp" = browser;
    "x-scheme-handler/about" = browser;
    "x-scheme-handler/unknown" = browser;
    "application/x-extension-htm" = browser;
    "application/x-extension-html" = browser;
    "application/x-extension-shtml" = browser;
    "application/xhtml+xml" = browser;
    "application/x-extension-xhtml" = browser;
    "application/x-extension-xht" = browser;

    "audio/*" = [ "mpv.desktop" ];
    "video/*" = [ "mpv.dekstop" ];
    "image/*" = [ "imv.desktop" ];
    "application/json" = browser;
    "application/pdf" = [ "org.pwmt.zathura.desktop.desktop" ];
    "x-scheme-handler/spotify" = [ "spotify.desktop" ];
    "x-scheme-handler/discord" = [ "WebCord.desktop" ];
  };
in
{
  imports = [
    ./cli.nix
    ./git.nix
    ./nix.nix
  ];
  services = {
    udiskie.enable = true;
    gpg-agent = {
      enable = true;
      pinentryFlavor = "gnome3";
      enableSshSupport = true;
      enableFishIntegration = true;
    };
  };
  programs = {
    man.enable = true;
    gpg = {
      enable = true;
      mutableKeys = true;
      mutableTrust = true;
      settings = {
        personal-cipher-preferences = [ "AES256" "AES192" "AES" ];
        personal-digest-preferences = [ "SHA512" "SHA384" "SHA256" ];
        #personal-compression-preferences = [ "ZLIB" "BZIP2" "ZIP" "Uncompressed" ];
        default-preference-list = [ "SHA512" "SHA384" "SHA256" "AES256" "AES192" "AES" "ZLIB" "BZIP2" "ZIP" "Uncompressed" ];
        cert-digest-algo = "SHA512";
        s2k-digest-algo = "SHA512";
        s2k-cipher-algo = "AES256";
        charset = "utf-8";
        fixed-list-mode = true;
        no-comments = true;
        no-emit-version = true;
        no-greeting = true;
        keyid-format = "0xlong";
        list-options = "show-uid-validity";
        verify-options = "show-uid-validity";
        with-fingerprint = true;
        with-key-origin = true;
        require-cross-certification = true;
        no-symkey-cache = true;
        use-agent = true;
        throw-keyids = true;
        default-key = "0xAD52C5FB3EFECC7A";
        trusted-key = "0xAD52C5FB3EFECC7A";
        keyserver = [
          "hkps://keys.openpgp.org"
        ];
      };
    };
  };
  xdg = {
    enable = true;
    userDirs = {
      enable = true;
      createDirectories = true;
      documents = "$HOME/other";
      download = "$HOME/download";
      videos = "$HOME/vids";
      music = "$HOME/music";
      pictures = "$HOME/pics";
      desktop = "$HOME/other";
      publicShare = "$HOME/other";
      templates = "$HOME/other";
      extraConfig = {
        XDG_DEVELOPMENT_DIR = "${config.xdg.userDirs.documents}/Dev";
      };

    };
    mimeApps.enable = true;
    mimeApps.associations.added = associations;
    mimeApps.defaultApplications = associations;
  };
}
