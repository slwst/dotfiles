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
  ];
}
