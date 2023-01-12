{
  description = "slwst NixOS configuration";
  # https://dotfiles.slw.st

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    hyprland.url = "github:hyprwm/Hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, ... } @ inputs:
    let
      system = "x86_64_linux";
      lib = nixpkgs.lib;


      pkgs = import inputs.nixpkgs {
        inherit system;
        config = {
          allowBroken = true;
          allowUnfree = true;
          tarball-ttl = 0;
        };
      };
    in
    rec
    {
      inherit lib pkgs;
      nixosConfigurations = import ./hosts inputs;
    };
}
