{ lib
, pkgs
, inputs
, ...
}: {
  imports = [
    # Hardware
    ./hardware-configuration.nix

    # Shared Configuration
    ../shared
    ../shared/users/slwst.nix
  ];

  boot = {
    loader = {
      systemd-boot.enable = true;
      efi.canTouchEfiVariables = true;
    };
  };
}
