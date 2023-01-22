{ lib
, pkgs
, self
, inputs
, ...
}: {
  imports = [
    ./fonts.nix
    ./locale.nix
    ./system.nix
    ./nix.nix
    ./network.nix
    ./users.nix
    ./environment
    ./security
    ./services
  ];
}
