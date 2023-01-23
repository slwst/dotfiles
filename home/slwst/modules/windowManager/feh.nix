{
  config,
  pkgs,
  inputs,
  ...
}: {
  home.packages = with pkgs; [
    feh
  ];

  systemd.user.services.feh-random-bg = {
    Unit.Description = "Switches to a random wallpaper";
    Install.WantedBy = [ "tray.target" ];
    Service = {
      Type = "oneshot";
      #[TODO] source the wallpaper dir from xdg
      ExecStart = ''
        ${pkgs.bash}/bin/bash ${pkgs.feh}/bin/feh --randomize --bg-fill ${config.home.homeDirectory}/pics/wallpaper/catppuccin
      '';
    };
  };

  systemd.user.timers.feh-random-bg = {
    Install = {
      WantedBy = [ "timers.target" ];
    };
    Timer = {
      OnUnitActiveSec = "1h";
      Unit = "feh-random-bg.service";
    };
  };
}
