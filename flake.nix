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
  outputs = {
    self,
    nixpkgs,
    ...
  } @ inputs: let
    inherit (self) outputs;
    system = "x86_64-linux";
    lib = nixpkgs.lib;

    pkgs = import inputs.nixpkgs {
      inherit system;
      config = {
        allowBroken = true;
        allowUnfree = true;
        tarball-ttl = 0;
      };
    };
  in rec
  {
    inherit lib pkgs;

    # modules
    nixosModules = import ./modules/nixos;
    # nixos configs
    nixosConfigurations = import ./hosts {inherit inputs outputs;};

    # dev shell for (direnv)
    devShells.${system}.default = pkgs.mkShell {
      packages = with pkgs; [
        alejandra
        git
        nix-prefetch-github
      ];
      name = "dotfiles";
    };

    # use alejandra as formatter
    formatter.${system} = pkgs.${system}.alejandra;
  };
}
