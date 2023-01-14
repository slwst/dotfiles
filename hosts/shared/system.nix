{ config
, pkgs
, ...
}: {
  services = {
    dbus = {
      packages = with pkgs; [dconf gcr udisks2];
      enable = true;
    };
    udev.packages = with pkgs; [gnome.gnome-settings-daemon];
    journald.extraConfig = ''
      MaxRetentionSec = 3456000
    '';
    udisks2.enable = true;
  };

  environment.variables = {
    EDITOR = "hx";
    BROWSER = "brave";
  };
  environment.systemPackages = with pkgs; [
    git
    vim
    kitty #for terminfo
  ];

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";

  console.keyMap = "us";
}
