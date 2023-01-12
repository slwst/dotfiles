{ config
, pkgs
, ...
}: {
  environment.variables = {
    EDITOR = "hx";
  };
  environment.systemPackages = with pkgs; [
    git
    helix
    vim
    kitty #for terminfo
  ];

  time.timeZone = "America/New_York";
  i18n.defaultLocale = "en_US.UTF-8";
}
