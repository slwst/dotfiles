{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.desktop.services.waybar;
in {
  options.modules.desktop.services.waybar = {
    enable = mkEnableOption "Adds waybar for more bar in your way";
  };

  config = mkIf cfg.enable ({
    programs.waybar = {
      enable = true;
      settings = {
        mainBar = {
          layer = "top";
          position = "top";
          height = 30;
          output = [
            "DP-1"
            "HDMI-A-1"
          ];
          modules-left = [ "sway/workspaces" "sway/mode" "wlr/taskbar" ];
          modules-center = [ "sway/window" "custom/hello-from-waybar" ];
          modules-right = [ "mpd" "custom/mymodule#with-css-id" "temperature" ];

          "sway/workspaces" = {
            disable-scroll = true;
            all-outputs = true;
          };
        };
      };
    };
  });
}
