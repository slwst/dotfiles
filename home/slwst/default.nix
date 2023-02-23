{
  config,
  inputs,
  outputs,
  pkgs,
  lib,
  ...
}: {
  imports = [
    ./home.nix
    ./packages.nix

    ./modules/shell
    ./modules/hyprland
    inputs.hyprland.homeManagerModules.default
    ./modules/windowManager
    ./modules/programs
    ./modules/desktop
  ];
  config.modules = {
    windowManager.i3.enable = false;
    #    hyprland.enable = true;
  };
}
