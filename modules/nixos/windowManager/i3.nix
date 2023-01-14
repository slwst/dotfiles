{
  config,
  pkgs,
  lib,
  ...
}: 
with lib; let
    cfg = config.modules.nixos.windowManager.i3;
in {
  options.modules.nixos.windowManager.i3 = {
    enable = mkEnableOption "Enable the i3 window manager";

    layout = mkOption {
      type = types.str;
      default = "us";
      description = "The keyboard layout to use for the X server.";
    };  
  };

  config = mkIf cfg.enable {
    services.xserver = {
      enable = true;
      autorun = true;

      dpi = 109;
      exportConfiguration = true;
      layout = "${cfg.layout}";

      libinput = {
        enable = true;
        touchpad = {
          disableWhileTyping = true;
          naturalScrolling = true;
        };
      };


      desktopManager.xterm.enable = false;
      displayManager.lightdm.enable = true;
      displayManager.defaultSession = "none+i3";
      # TODO move non-default config items to user modules
      windowManager.i3 = {
        enable = true;
        configFile = ./i3-config;
      };
    };
    xdg.portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-kde
      ];
    };
    qt = {
      enable = true;
      style = "adwaita";
      platformTheme = "gnome";
    };
  };
}
