{ config
, pkgs
, inputs
, ...
}:
{
  services.xserver = {
    enable = true;
    autorun = true;
    layout = "us";
    desktopManager.xterm.enable = false;
    displayManager.lightdm.enable = true;
    displayManager.defaultSession = "none+i3";
    windowManager.i3 = {
      enable = true;
      configFile = ./i3-config;
      extraPackages = with pkgs; [
        polybar
      ];
    };
  };
}
