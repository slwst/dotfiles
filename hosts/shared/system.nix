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
  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  console.keyMap = "us";
}
