{
  pkgs,
  lib,
  config,
  ...
}:
with lib; let
  cfg = config.modules.desktop.services.swaylock;
in {
  options.modules.desktop.services.swaylock = {
    enable = mkEnableOption "A lockscreen for sway";
  };

  config = mkIf cfg.enable ({
    programs.swaylock = {
      enable = true;
      settings = {
        color = "808080";
        font-size = 24;
        indicator-idle-visible = false;
        indicator-radius = 100;
        line-color = "ffffff";
        show-failed-attempts = true;
      };
    };
  
  });
}
