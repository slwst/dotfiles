inputs:
let
  inherit (inputs) self;
  inherit (self.lib) nixosSystem;

  i3 = ../modules/i3;
  sharedModules = [
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs self; };
        users.slwst = ../modules/home;
      };
    }
  ];

in
{
  # desktop
  epsilon = nixosSystem {
    system = "x86_64-linux";
    modules = [
      { networking.hostName = "epsilon"; }
      ./epsilon
      i3
    ]
    ++ sharedModules;
    specialArgs = { inherit inputs; };
  };

  # vm
  nixie = nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        { networking.hostName = "nixie"; }
        ./nixie
        i3
      ]
      ++ sharedModules;
    specialArgs = { inherit inputs; };
  };
}
  