{
  config,
  outputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./home.nix
    ./packages.nix

    ./modules/shell
    ./modules/windowManager
    ./modules/programs
    ./modules/desktop
  ];
  config.modules = {
    windowManager.i3.enable = true;
    windowManager.sway.enable = false;
  };
}
