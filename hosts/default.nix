inputs:
let
  inherit (inputs) self;
  inherit (self.lib) nixosSystem;

  i3 = ../modules/i3;
  rofi = ../modules/rofi;
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

  # vm
  nixie = nixosSystem {
    modules =
      [
        ./nixie
        { networking.hostName = "nixie"; }
        i3
      ]
      ++ sharedModules;
    specialArgs = { inherit inputs; };
    system = "x86_64-linux";
  };
}
  