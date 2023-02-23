{
  description = "slwst NixOS configuration";
  # https://dotfiles.slw.st

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    nixpkgs-slwst.url = "github:slwst/nixpkgs/adi1090x-plymouth-themes";
    nixpkgs-wayland.url = "github:nix-community/nixpkgs-wayland";

    helix.url = "github:helix-editor/helix";

    hyprland.url = "github:hyprwm/Hyprland/";
    xdg-portal-hyprland.url = "github:hyprwm/xdg-desktop-portal-hyprland";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    rust-overlay = {
      url = "github:oxalica/rust-overlay";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nil = {
      url = "github:oxalica/nil";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.rust-overlay.follows = "rust-overlay";
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
      overlays = with inputs; [
        (
          final: prev: let
            inherit (final) system;
          in {
            adi1090x-plymouth-themes = nixpkgs-slwst.legacyPackages.${system}.adi1090x-plymouth-themes;
          }
        )
      ];
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
    formatter.${system} = nixpkgs.legacyPackages.${system}.alejandra;
  };
}
