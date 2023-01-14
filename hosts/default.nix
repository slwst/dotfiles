{inputs,
outputs,
...
}:
let
  sharedModules = [
    inputs.home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs outputs; };
        users.slwst = ../home/slwst;
      };
    }
  ]
  ++ (builtins.attrValues outputs.nixosModules);

in
{
  # desktop
  epsilon = outputs.lib.nixosSystem {
    system = "x86_64-linux";
    modules = [
      { networking.hostName = "epsilon"; }
      ./epsilon
      ../modules/i3
    ]
    ++ sharedModules;
    specialArgs = { inherit inputs; };
  };

  # vm
  nixie = outputs.lib.nixosSystem {
    system = "x86_64-linux";
    modules =
      [
        { networking.hostName = "nixie"; }
        ./nixie
        ../modules/i3
      ]
      ++ sharedModules;
    specialArgs = { inherit inputs; };
  };
}
  