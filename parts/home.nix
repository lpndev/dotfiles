{
  inputs,
  ...
}:

{
  flake.homeModules.lain = {
    imports = [
      (inputs.import-tree ../home/lain)
    ];
    home.stateVersion = "26.11";
  };

  flake.nixosModules.home = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
    ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      users = inputs.self.homeModules;
    };
  };
}
