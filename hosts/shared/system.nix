{ config
, pkgs
, ...
}: {
  services = {
    dbus = {
      packages = with pkgs; [dconf gcr udisks2];
      enable = true;
    };
    journald.extraConfig = ''
      MaxRetentionSec = 3456000
    '';
    udev.packages = with pkgs; [
      gnome.gnome-settings-daemon
      yubikey-personalization
    ];
    udisks2.enable = true;
    pcscd.enable = true;
  };

  environment.variables = {
    EDITOR = "hx";
    BROWSER = "brave";
  };
  security.pam = {
    u2f.enable = true;
    u2f.cue = true;
    services = {
      login.u2fAuth = true;
      sudo.u2fAuth = true;
    };
  };

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  console.keyMap = "us";
}
