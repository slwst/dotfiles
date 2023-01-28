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

      config = lib.mkAfter ''
      Section "InputClass"
       Identifier   "ds-touchpad"
       Driver       "libinput"
       MatchProduct "Wireless Controller Touchpad"
       Option       "Ignore" "True"
      EndSection
      '';

      displayManager = {
        defaultSession = "none+i3";
        lightdm = {
          enable = true;
          greeters.gtk = {
            enable = true;
            cursorTheme = {
              name = "Catppuccin-Frappe-Dark-Cursors";
              package = pkgs.catppuccin-cursors.frappeDark;
              size = 16;
            };
            iconTheme = {
             name = "Papirus-Dark"; 
            };
            theme = {
              name = "Catppuccin-Frappe-Standard-Teal-Dark";
            };
          };
        };
      };

      # TODO move non-default config items to user modules
      windowManager.i3.enable = true;
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
    security.pam.services.lightdm.u2fAuth = true;
    environment.systemPackages = with pkgs; [
      catppuccin-cursors.frappeDark
      (catppuccin-gtk.override { accents = ["teal"]; })
      feh
      gtk2
      gtk3
      gtk4
      papirus-icon-theme
    ];
  };
}
