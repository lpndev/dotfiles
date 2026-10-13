{ inputs, ... }:

{
  flake.nixosModules.home = {
    imports = [ inputs.home-manager.nixosModules.home-manager ];

    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      extraSpecialArgs = { inherit inputs; };

      users.lain = {
        imports = [ (inputs.import-tree ../home/lain) ];
        home.stateVersion = "26.11";
      };
    };
  };
}
