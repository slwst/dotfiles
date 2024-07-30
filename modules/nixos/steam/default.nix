{
  config,
  pkgs,
  lib,
  ...
}:
with lib; let
  cfg = config.modules.nixos.steam;
in {
  options.modules.nixos.steam = {
    enable = mkEnableOption "Enable Steam";
  };

  config = mkIf cfg.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = false;
      protontricks.enable = true;
      gamescopeSession.enable = true;
      /*
      extraPackages = with pkgs; [
        mumble_overlay
        gamescope
      ];
      */
    };
    programs.gamemode.enable = true;

    boot.kernelParams = [
      "split_lock_detect=off"
      "clearcpuid=514"
    ];

    environment = {
      sessionVariables = rec {
        STEAM_EXTRA_COMPAT_TOOLS_PATHS = "\${HOME}/.steam/root/compatibilitytools.d";
        PATH = [
          "\${XDG_BIN_HOME}"
        ];
      };

      systemPackages = with pkgs; [
        nspr # albion
        protonup
        #        gamemode
        steamcmd
        SDL2
        protontricks
        lutris
        wine
        wine64
        winetricks
        wmctrl
        python3
      ];
    };
  };
}
