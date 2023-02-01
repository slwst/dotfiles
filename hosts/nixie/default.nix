{
  lib,
  pkgs,
  inputs,
  ...
}: {
  imports = [
    # Hardware
    ./hardware-configuration.nix

    # Shared Configuration
    ../shared
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
