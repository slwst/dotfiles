inputs:
let
  inherit (inputs) self;
  inherit (self.lib) nixosSystem;

  sharedModules = [
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs self; };
        users.slwst = ../home/slwst;
      };
    }
  ];

in
{
  # desktop

  # vm
  nixie = nixosSystem {
    modules =
      [
        ./nixie
        { networking.hostName = "nixie"; }
      ]
      ++ sharedModules;
    specialArgs = { inherit inputs; };
    system = "x86_64-linux";
  };
}
  